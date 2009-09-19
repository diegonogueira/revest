class CreateLines < ActiveRecord::Migration
  def self.up
    create_table :lines do |t|
      t.string :name, :limit=>30, :null=>false
      t.text :description
      t.boolean :status, :default=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :lines
  end
end
