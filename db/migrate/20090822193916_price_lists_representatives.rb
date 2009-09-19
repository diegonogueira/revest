class PriceListsRepresentatives < ActiveRecord::Migration
  def self.up
    create_table :price_lists_representatives, :id=>false do |t|
		t.integer :price_list_id, :null=>false
		t.integer :representative_id,:null=>false
    end
    add_index :price_lists_representatives, :price_list_id
    add_index :price_lists_representatives, :representative_id
  end

  def self.down
    remove_index :price_lists_representatives, :price_list_id
    remove_index :price_lists_representatives, :representative_id     
    drop_table :price_lists_representatives
  end
end
