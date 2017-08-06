FactoryGirl.define do
  factory :vault, class: Vault do
    value { Faker::Number.decimal(6, 2) }
    type_value { [0, 1].sample }
    account
  end
end
