FactoryBot.define do
  factory(:review) do
    author {Faker::FunnyName.two_word_name}
    content {Faker::Hipster.paragraph_by_chars(characters: 250, supplemental: false)}
  end
end