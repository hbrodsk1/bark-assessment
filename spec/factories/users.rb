FactoryBot.define do
  factory :user do
    name { 'First Last' }
    sequence :email do |n|
      "foo_#{n}@bar.com"
    end
    password { 'password' }
  end
end