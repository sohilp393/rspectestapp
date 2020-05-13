# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone do
    association :contact
    phone { Faker::PhoneNumber.phone_number }

    trait :home_phone do
      phone_type 'home'
    end

    trait :work_phone do
      phone_type 'work'
    end

    trait :mobile_phone do
      phone_type 'mobile'
    end
  end
end
