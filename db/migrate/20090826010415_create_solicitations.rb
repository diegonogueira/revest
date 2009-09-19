class CreateSolicitations < ActiveRecord::Migration
  def self.up
    create_table :solicitations do |t|
      t.integer :representative_id, :null => false
      t.integer :customer_id, :null => false
      t.integer :carrier_id
      t.integer :carrier_price_list_id
      t.integer :payment_form_id
      t.decimal :freight_price
      t.integer :quantity
      t.string :delivery_address
      t.string :delivery_number, :limit=>10
      t.string :delivery_complement, :limit=>50
      t.string :delivery_neighborhood, :limit=>50
      t.string :delivery_city, :limit=>50
      t.string :delivery_state, :limit=>50
      t.string :delivery_zip_code, :limit=>9
      t.string :delivery_reference, :limit=>50
      t.integer :status, :default => 1
      t.text :showcase
      t.text :obs
      t.timestamps
    end
    add_index :solicitations,:representative_id
    add_index :solicitations,:customer_id
    add_index :solicitations,:carrier_id
    add_index :solicitations,:carrier_price_list_id
    add_index :solicitations,:payment_form_id
  end

  def self.down
    remove_index :solicitations,:customer_id
    remove_index :solicitations,:carrier_id
    remove_index :solicitations,:carrier_table_id
    remove_index :solicitations,:payment_form_id    
    drop_table :solicitations
  end
end
