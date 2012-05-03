class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :name
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
