class NewBlogPostHandler < AppHandler
  def initialize(form:)
    @form = form
  end
  def handle
    if @form.valid?
      if @form.content.split(/\s/).length < 5
        @form.server_side_constraint_violation(
          input_name: :content,
          key: :not_enough_words,
          context: { num_words: 5 }
        )
      end
    end
    if @form.constraint_violations?
      BlogPostEditorPage.new(form: @form)
    else
      DB::BlogPost.create(
        title: @form.title,
        content: @form.content
      )
      redirect_to(HomePage)
    end
  end
end
