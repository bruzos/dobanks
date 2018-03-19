class Account < ApplicationRecord
  belongs_to :bank
  belongs_to :user
  has_many :transactions

  validates :iban_string, presence: true
  validates_with Account::IbanValidator, :attributes=>[:iban_string]
  validates :bank, :user, presence: true

  monetize :balance_cents

  private

  def iban_valid?
    ISO::IBAN.valid?( iban_string )
  end
end
