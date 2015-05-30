FactoryGirl.define do  factory :enrollment do
    
  end
  

  factory :lesson do
    title "Don't forget the server!"
    subtitle "rails s"
    association :section
  end
  

  factory :section do
    title "Welcome Aboard"
    association :course
  end

  factory :course do
    title "Rails 101"
    description "Intro to Ruby on Rails"
    cost "0.0"
    association :user
  end

  factory :user do
  	sequence :email do |n|
      	"heyheyhey#{n}@gmail.com"
    end
    password "password"
    password_confirmation "password"
  end
end