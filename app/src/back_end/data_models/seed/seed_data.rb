require "brut/back_end/seed_data"
class SeedData < Brut::BackEnd::SeedData
  include FactoryBot::Syntax::Methods
  def seed!
    10.times do |i|
      create(:blog_post, created_at: Date.today - i)
    end
  end
end
