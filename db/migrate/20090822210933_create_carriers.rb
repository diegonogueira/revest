class CreateCarriers < ActiveRecord::Migration
 def self.up
    create_table :carriers do |t|
      t.string :name, :limit=>100,:null=>false
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
      t.string :contact, :limit=>30
      t.string :cnpj_cpf, :limit=>18
      t.integer :person_type
      t.string :insc_estadual, :limit=>30
      t.string :insc_municipal, :limit=>30
      t.string :email, :limit=>100
      t.string :site, :limit=>100
      t.boolean :status, :default=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :carriers
  end
end
