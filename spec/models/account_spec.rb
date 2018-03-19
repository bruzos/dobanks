require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account_valid){ create(:account) }

  it { should belong_to(:bank) }
  it { should validate_presence_of(:bank) }

  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }



  describe '#iban_string'  do

    it { should validate_presence_of(:iban_string) }

    context 'wrong value' do
      let(:account_iban_nil){ build(:account, iban_string: 'CH37 1234 5987 6543 2109 A') }

      it { expect(account_iban_nil.valid?).to be_falsey }
      it { expect(subject.send(:iban_valid?)).to be_falsey}
    end

    context 'nil value' do
      let(:account_iban_nil){ build(:account, iban_string: nil) }

      it { expect(account_iban_nil.valid?).to be_falsey }
      it { expect(subject.send(:iban_valid?)).to be_falsey}

    end

    context 'valid value' do
      subject{ account_valid }

      it { is_expected.to be_valid }
      it { expect(subject.send(:iban_valid?)).to be_truthy}
    end

  end

  describe '#balance' do

    subject {account_valid}

    it { is_expected.to monetize(:balance) }

  end


end
