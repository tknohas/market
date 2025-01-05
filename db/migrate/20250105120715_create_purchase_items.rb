class CreatePurchaseItems < ActiveRecord::Migration[8.0]
  def change
    create_table :purchase_items do |t|
      t.references :product, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
    add_index :purchase_items, %i[product_id purchase_id], unique: true
  end
end
