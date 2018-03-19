class Transaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :account

  validates_presence_of :account,:transaction_type
end
