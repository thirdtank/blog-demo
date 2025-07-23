require "spec_helper"

RSpec.describe NewBlogPostHandler do
  describe "#handle!" do
    context "client-side violations got to the server" do
      it "re-generates the HTML for the BlogPostEditorPage" do
        form  = NewBlogPostForm.new(params: {})

        result = described_class.new(form:).handle!

        expect(result).to have_generated(BlogPostEditorPage)
        expect(form).to have_constraint_violation(:title, key: :valueMissing)
        expect(form).to have_constraint_violation(:content, key: :valueMissing)
      end
    end
    context "post is not enough words" do
      it "re-generates the HTML for the BlogPostEditorPage, with server-side errors indicated" do
        form  = NewBlogPostForm.new(params: {
          title: "What a great post",
          content: "Not enough words",
        })

        confidence_check { expect(form.constraint_violations?).to eq(false) }

        result = described_class.new(form:).handle!

        expect(result).to have_generated(BlogPostEditorPage)
        expect(form).to have_constraint_violation(:content, key: :not_enough_words)
      end
    end
    context "post is good!" do
      it "saves the post and redirects to the HomePage" do
        form  = NewBlogPostForm.new(params: {
          title: "What a great post",
          content: "This post is the best post that has been written in the history of posts",
        })

        confidence_check { expect(form.constraint_violations?).to eq(false) }

        result = nil
        expect {
          result = described_class.new(form:).handle!
        }.to change { DB::BlogPost.count }.by(1)

        expect(result).to have_redirected_to(HomePage)
      end
    end
  end
end
