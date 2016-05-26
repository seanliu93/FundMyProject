class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :fund_goal
      t.date :end_date
    end
  end
end