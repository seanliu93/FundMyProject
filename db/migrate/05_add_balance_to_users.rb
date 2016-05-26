class AddBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :balance, :integer, default: 10000
  end
end
