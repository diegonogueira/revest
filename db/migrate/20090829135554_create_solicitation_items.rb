class CreateSolicitationItems < ActiveRecord::Migration
  def self.up
    create_table :solicitation_items do |t|
      t.integer :price_list_id, :null => false
      t.integer :quantity
      t.integer :product_id, :null => false
      t.decimal :price
      t.integer :solicitation_id, :null => false

      t.timestamps
    end
    add_index :solicitation_items, :price_list_id
    add_index :solicitation_items, :product_id
    add_index :solicitation_items, :solicitation_id
  end

  def self.down
    remove_index :solicitation_items, :price_list_id
    remove_index :solicitation_items, :product_id
    remove_index :solicitation_items, :solicitation_id     
    drop_table :solicitation_items   
  end
end
