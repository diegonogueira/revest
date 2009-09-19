class CreateDependentRepresentatives < ActiveRecord::Migration
  def self.up
    create_table :dependent_representatives do |t|
      t.string :name, :limit=>100, :null=>false
      t.string :email, :limit=>100
      t.string :phone, :limit=>13
      t.string :cpf, :limit=>13
		  t.integer :representative_id,:null=>false
      t.timestamps
    end
    add_index :dependent_representatives, :representative_id
  end

  def self.down
    remove_index :dependent_representatives, :representative_id        
    drop_table :dependent_representatives
  end
end
