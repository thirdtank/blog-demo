class NewBlogPostForm < AppForm
  input :title, minlength: 3
  input :content
end
