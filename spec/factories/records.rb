FactoryBot.define do
  factory :record do
    title                { Faker::Lorem.characters(number: 40) }
    content              { Faker::Lorem.characters(number: 1000) }
    association :creator
    after(:build) do |record|
      record.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end