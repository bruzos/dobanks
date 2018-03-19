class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :user
  has_many :transactions

  validates :iban_string, presence: true
  validates_with Account::IbanValidator, fields: [:iban_string]
  validates :bank, :user, presence: true

end
