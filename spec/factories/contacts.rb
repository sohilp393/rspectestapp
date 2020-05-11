# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    first_name	{ Faker::Name.first_name }
    last_name	{ Faker::Name.last_name }
    # sequence is a feature of factorygirl
    # sequence(:email) { |n| "johndoe#{n}@example.com"}
    email	{ Faker::Internet.email }
  end
end
