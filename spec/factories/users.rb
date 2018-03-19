FactoryBot.define do
  factory :user do
    first_name "Jim"
    last_name  "Blow"

    trait :ES_BANK do
      login { "admin-#{name}" }
    end

    factory :male_admin,   traits: [:male, :admin]   # login will be "admin-John Doe"

  end
end
