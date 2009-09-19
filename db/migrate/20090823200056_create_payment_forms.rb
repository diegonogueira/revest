class CreatePaymentForms < ActiveRecord::Migration
  def self.up
    create_table :payment_forms do |t|
      t.decimal :initial_interval
      t.decimal :end_interval
      t.string :name, :limit => 50, :null => false
      t.boolean :status
      t.timestamps
    end
  end

  def self.down
    drop_table :payment_forms
  end
end
