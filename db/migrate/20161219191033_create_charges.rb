class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.date :transaction_date, null: false
      t.string :description
      t.integer :category_id, index: true
      t.boolean :processed, default: false
      t.decimal :amount, precision: 6, scale: 2, null: false
      t.timestamps null: false
    end

    create_table :categories do |t|
      t.string :name, null: false
      t.string :description
      t.decimal :limit, precision: 6, scale: 2, null: false
    end
  end
end
