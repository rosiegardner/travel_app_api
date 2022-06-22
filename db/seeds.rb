class Seed

  def self.begin
    seed = Seed.new
    seed.generate_reviews
  end

  def generate_reviews
    20.times do |i|
      review = Review.create!(
        author: Faker::FunnyName.two_word_name,
        content: Faker::Hipster.paragraph_by_chars(characters: 250, supplemental: false)
      )
      puts "Review #{i}: Author is #{review.author} and review is '#{review.content}'."
    end
  end     
end

Seed.begin