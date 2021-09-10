FactoryBot.define do
  factory :post do
    user
    title             { Faker::Lorem.sentence(word_count: 4) }
    slug              { Faker::Internet.slug(words: "#{title}", glue: '-') }
    summary           { Faker::Lorem.sentences(number: 2) }
    content           { Faker::Markdown.random }
    published         { true }
    published_at      { Time.zone.now }
  end
end
