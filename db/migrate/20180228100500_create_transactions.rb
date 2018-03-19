class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.belongs_to  :account
      t.belongs_to  :transaction_type
      t.monetize :among
      t.monetize :fee
      t.timestamps
    end
  end
end
