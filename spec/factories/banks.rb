FactoryBot.define do
  factory :bank do
    name 'ING BANK'
    bank_code '1465'

    trait :uk_sank do
      name 'UK_SANK'
      country 'UK'
      bank_code '1234'
    end

    factory :uk_sank, traits: [:uk_sank]
  end
end
