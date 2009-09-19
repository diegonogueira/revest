class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
		t.string :title, :limit=>100    
    t.integer :photograph_id, :null=>false
    t.string :photograph_type, :null=>false
    t.text :description
    t.string :image_file_name,:limit=>60
    t.string :image_content_type
    t.integer :image_file_size
    t.datetime :image_updated_at
    t.boolean :status,:default=>true
    t.integer :photo_type
    t.timestamps
    end
    add_index :photos, :photograph_id
    add_index :photos, :photograph_type
  end

  def self.down
    remove_index :photos, :photograph_id
    remove_index :photos, :photograph_type
    drop_table :photos
  end
end
