class CarriersRepresentatives < ActiveRecord::Migration
  def self.up
    create_table :carriers_representatives, :id=>false do |t|
		t.integer :carrier_id, :null=>false
		t.integer :representative_id,:null=>false
    end
    add_index :carriers_representatives, :carrier_id
    add_index :carriers_representatives, :representative_id
  end

  def self.down
    remove_index :carriers_representatives, :carrier_id
    remove_index :carriers_representatives, :representative_id     
    drop_table :carriers_representatives
  end
end
