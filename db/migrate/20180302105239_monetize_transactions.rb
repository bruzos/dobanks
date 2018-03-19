class MonetizeTransactions < ActiveRecord::Migration[5.1]
  def change
    add_monetize :transactions, :price
  end
end
