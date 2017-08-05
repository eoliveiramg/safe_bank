FactoryGirl.define do
  factory :account, class: Account do
    name { Faker::Name.name }
  end
end
