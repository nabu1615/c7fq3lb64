class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :category, index: true
      t.date :date
      t.string :concept
      t.decimal :amount
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :expenses, :categories
    add_foreign_key :expenses, :users
  end
end
