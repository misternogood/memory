FactoryBot.define do
  factory :creator do
    name                {Faker::Name.initials(number: 2)}
    birth_date          {Faker::Date.between(from: '1930-01-01', to: '2022-12-31')}
    association :user
    after(:build) do |creator|
      creator.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
