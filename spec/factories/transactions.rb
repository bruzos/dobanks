FactoryBot.define do
  factory :transaction do
    user
    account
    transaction_type
    among{ Money.new(1000, "EUR") }
  end
end
