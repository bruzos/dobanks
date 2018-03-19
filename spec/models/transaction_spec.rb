require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should belong_to(:account) }
  it { should belong_to(:transaction_type) }

  it { should validate_presence_of(:account) }
  it { should validate_presence_of(:transaction_type) }

  let(:account){create(:account)}

end
