class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.belongs_to  :bank
      t.belongs_to  :user
      t.string :iban_string
      t.monetize :balance
      t.timestamps
    end

    add_index :accounts, :iban_string, unique: true

  end
end
