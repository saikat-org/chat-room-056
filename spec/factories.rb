FactoryBot.define do
  factory :user do
    first_name  { 'first' }
    last_name   { 'last' }
    email       { "abc@account.com" }
    password    { '123456' }

    factory :user_with_avatar do
      after(:build) do |user|
        user.avatar.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'avatar.jpg')), filename: 'avatar.jpg', content_type: 'image/jpeg')
      end
    end
  end
end
