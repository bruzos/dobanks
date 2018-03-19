class Account::IbanValidator < ActiveModel::Validator
  def validate(record)
    if ISO::IBAN.valid?(record.send(:iban_string)) == false
      record.errors[:iban_string] << "This IBAN is invalid"
    end
  end
end