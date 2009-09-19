class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :solicitation_id, :null => false
      t.date :sale_date, :null => false
      t.string :invoice, :null => false
		  t.integer :status, :default => true
      t.timestamps
    end
    add_index :sales, :solicitation_id
  end

  def self.down
    remove_index :sales, :solicitation_id    
    drop_table :sales
  end
end
