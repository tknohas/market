class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
