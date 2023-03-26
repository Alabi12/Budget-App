class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :author_name
      t.decimal :amount

      t.timestamps
    end
  end
end
