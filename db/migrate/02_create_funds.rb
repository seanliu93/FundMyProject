class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.integer :backer_id
      t.integer :project_id
      t.integer :amount
    end
  end
end