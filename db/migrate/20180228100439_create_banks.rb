class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.string :name
      t.timestamps
      t.integer :bank_code, limit: 4
      t.monetize :transfer_fee
      t.monetize :transfer_limit
    end
  end
end
