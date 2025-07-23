FactoryBot.define do
  factory :blog_post, class: "DB::BlogPost" do
    title { Faker::Hipster.sentence }
    content {
      (rand(4) + 2).times.map {
        Faker::Hipster.paragraph_by_chars(characters: 200)
      }.join("\n\r")
    }
  end
end

