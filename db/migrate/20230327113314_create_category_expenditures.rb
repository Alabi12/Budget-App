class CreateCategoryExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_table :expenditures_categories, id: false do |t|
      t.belongs_to :expenditure
      t.belongs_to :category
    end

    add_index :expenditures_categories, [:expenditure_id, :category_id], unique: true    
    end
end
