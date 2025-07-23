require "spec_helper"

RSpec.describe "We can post a new blog post" do
  it "allows posting a post" do
    page.goto(HomePage.routing)
    new_post_link = page.locator("a[href='#{BlogPostEditorPage.routing}']")
    new_post_link.click

    expect(page).to be_page_for(BlogPostEditorPage)

    title_field   = page.locator("brut-form input[name='title']")
    content_field = page.locator("brut-form textarea[name='content']")

    title_field.fill("XX")

    submit_button = page.locator("brut-form button")
    submit_button.click

    expect(page).to be_page_for(BlogPostEditorPage)

    title_error_message   = page.locator("brut-cv-messages[input-name='title'] brut-cv")
    content_error_message = page.locator("brut-cv-messages[input-name='content'] brut-cv")

    expect(title_error_message).to   have_text("This field is too short")
    expect(content_error_message).to have_text("This field is required")

    title_field.fill("New blog post")
    content_field.fill("Too short")

    submit_button.click

    expect(page).to be_page_for(BlogPostEditorPage)

    expect(content_error_message).to have_text("This field does not have enough words")

    content_field.fill("This is a longer post, so we should be OK")

    submit_button.click
    expect(page).to be_page_for(HomePage)

    new_post = DB::BlogPost.order(Sequel.desc(:created_at)).first

    article = page.locator("article##{new_post.external_id}")

    expect(article).to have_text("New blog post")
    expect(article).to have_text("This is a longer post, so we should be OK")

  end

end
