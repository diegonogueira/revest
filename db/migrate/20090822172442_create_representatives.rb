class CreateRepresentatives < ActiveRecord::Migration
  def self.up
    create_table :representatives do |t|
      t.date :start
      t.integer :person_type
      t.string :name, :limit=>100, :null=>false
      t.string :fantasy_name, :limit=>100
      t.string :cnpj_cpf, :limit=>18
      t.string :insc_estadual, :limit=>30
      t.string :insc_municipal, :limit=>30
      t.string :address, :limit=>100
      t.string :number, :limit=>10
      t.string :complement, :limit=>50
      t.string :neighborhood, :limit=>50
      t.string :city, :limit=>50
      t.string :state, :limit=>50
      t.string :zip_code, :limit=>9
      t.string :phone1, :limit=>13
      t.string :phone2, :limit=>13
      t.date :date_birth
      t.string :rg, :limit=>20
      t.string :email, :limit=>100
      t.string :msn, :limit=>100
      t.string :bank, :limit=>50
      t.string :agency, :limit=>10
      t.string :account, :limit=>15
      t.text :sent_material
      t.string :transporter, :limit=>100
      t.date :sent_date
      t.date :received_date
      t.decimal :freight_price
      t.text :cities_served
      t.text :main_customers
      t.text :commercial_references
      t.text :represented_current
      t.boolean :status, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :representatives
  end
end
