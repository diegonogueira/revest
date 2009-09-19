class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.integer :line_id,:null=>false
      t.string :name, :limit=>30, :null=>false
      t.string :color, :limit=>30
      t.string :code, :limit=>30
      t.text :description
      t.text :features
      t.string :bar_code, :limit=>255
      t.string :palet_m2, :limit=>10
      t.string :box_m2, :limit=>10
      t.string :weight_m2, :limit=>10
      t.boolean :status, :default=>true
      t.timestamps
    end
    add_index :products, :line_id
  end

  def self.down
    drop_table :products
    remove_index :products, :line_id    
  end
end
