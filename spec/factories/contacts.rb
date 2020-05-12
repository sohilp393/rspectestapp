# frozen_string_literal: true

# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :contact do
    first_name	{ Faker::Name.first_name }
    last_name	{ Faker::Name.last_name }
    email	{ Faker::Internet.email }

  	factory :joe do
  		first_name 'Joe'
  		last_name 'Button'
  		email 'tester@example.com'
  	end

    factory :jane do
  		first_name 'Jane'
  		last_name 'Button'
  		email 'tester@example.com'
  	end

  	factory :jones do
  		first_name 'John'
  		last_name 'Jones'
  		email 'jones@example.com'	
  	end	
  	
  	factory :wick do
  		first_name 'John'
  		last_name 'Wick'
  		email 'wick@example.com'	
  	end
  	
  end
end

