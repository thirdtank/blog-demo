class HomePage < AppPage
  def page_template
    header do
      h1 { "Dave's Exicting Information" }
      a(href: BlogPostEditorPage.routing) { "Write New Blog Post" }
    end
    main do
      DB::BlogPost.order(Sequel.desc(:created_at)).each do |blog_post|
        article(id: blog_post.external_id) do
          h2 { blog_post.title }
          blog_post.content.split(/\n\r/).each do |paragraph|
            p { paragraph }
          end
        end
        hr
      end
    end
  end
end
