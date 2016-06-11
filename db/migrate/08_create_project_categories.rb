class CreateProjectCategories < ActiveRecord::Migration
  def change
    create_table :project_categories do |t|
      t.integer :project_id, index: true, foreign_key: true
      t.integer :category_id, index: true, foreign_key: true
    end
  end
end