class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.integer :representative_id,:null=>false
      t.string :name, :limit=>100, :null=>false
      t.string :fantasy_name, :limit=>100
      t.string :address, :limit=>100
      t.string :number, :limit=>10
      t.string :complement, :limit=>50
      t.string :neighborhood, :limit=>50
      t.string :city, :limit=>50
      t.string :state, :limit=>50
      t.string :zip_code, :limit=>9
      t.string :phone1, :limit=>13
      t.string :phone2, :limit=>13
      t.string :email, :limit=>100
      t.string :contact, :limit=>30
      t.string :cnpj_cpf, :limit=>18, :null => false
      t.integer :person_type
      t.string :insc_estadual, :limit=>30
      t.string :insc_municipal, :limit=>30
      t.boolean :status,:default=>true

      t.timestamps
    end
    add_index :customers, :representative_id
  end

  def self.down
    remove_index :customers, :representative_id        
    drop_table :customers
  end
end
