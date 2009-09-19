class CreateSaleItems < ActiveRecord::Migration
  def self.up
    create_table :sale_items do |t|
      t.integer :sale_id
      t.integer :solicitation_item_id
      t.integer :quantity
      t.decimal :price
      t.timestamps
    end
    add_index :sale_items, :sale_id
    add_index :sale_items, :solicitation_item_id
  end

  def self.down
    remove_index :sale_items, :sale_id 
    remove_index :sale_items, :solicitation_item_id   
    drop_table :sale_items
  end
end
