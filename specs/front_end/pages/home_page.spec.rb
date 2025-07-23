require "spec_helper"

RSpec.describe HomePage do
  it "should show the blog posts" do
    blog_posts = 4.times.map { create(:blog_post) }

    result = generate_and_parse(described_class.new)

    expect(result.e!("h1").text).to eq("Dave's Exicting Information")

    blog_posts.each do |blog_post|
      post_article = result.e!("article##{blog_post.external_id}")
      expect(post_article.e!("h2").text).to eq(blog_post.title)
      blog_post.content.split(/\n\r/).each do |paragraph|
        expect(post_article.text).to include(paragraph)
      end
    end
  end

end
