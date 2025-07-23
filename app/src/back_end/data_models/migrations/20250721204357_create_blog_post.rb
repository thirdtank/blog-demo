Sequel.migration do
  up do
    create_table :blog_posts,
      comment: "All the posts fit to post",
      external_id: true do
        column :title, :text
        column :content, :text
      end
  end
end
