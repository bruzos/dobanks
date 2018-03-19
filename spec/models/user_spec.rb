require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:bank) { create(:bank) }
  let(:account){ build(:account) }

  it 'He can create new accounts' do
    user.accounts << account
    expect(user.save).to be_truthy
    expect(user.accounts.size).to eq(1)
  end

  it 'He can´t create an account without a bank' do
    user.accounts << Account.new(bank: nil)
    expect(user.save).to be_falsey
  end

end
