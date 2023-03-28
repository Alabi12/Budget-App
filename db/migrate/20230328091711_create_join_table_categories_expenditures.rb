class CreateJoinTableCategoriesExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :expenditures do |t|
      # t.index [:category_id, :expenditure_id]
      # t.index [:expenditure_id, :category_id]
    end
  end
end
