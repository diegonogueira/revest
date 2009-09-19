class CreatePriceLists < ActiveRecord::Migration
  def self.up
    create_table :price_lists do |t|
      t.string :name,:limit=>50,:null=>false
      t.integer :mounth
      t.integer :year
      t.decimal :price
      t.integer :term_payment_id
      t.integer :product_id
      t.integer :type_freight
      t.boolean :status

      t.timestamps
    end
    add_index :price_lists, :term_payment_id
    add_index :price_lists, :product_id
  end

  def self.down
    remove_index :price_lists, :term_payment_id
    remove_index :price_lists, :product_id 
    drop_table :price_lists  
  end
end
