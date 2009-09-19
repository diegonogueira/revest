class CreateCarrierPriceLists < ActiveRecord::Migration
  def self.up
    create_table :carrier_price_lists do |t|
      t.integer :carrier_id, :null => false
      t.string :region
      t.decimal :price
      t.string :distance
      t.boolean :status
		  t.string :name, :limit => 50, :null => false
      t.timestamps
    end
    add_index :carrier_price_lists, :carrier_id
  end

  def self.down
    remove_index :carrier_price_lists, :carrier_id        
    drop_table :carrier_price_lists
  end
end
