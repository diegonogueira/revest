class Sale < ActiveRecord::Base
  
  #validates
  validates_presence_of :solicitation_id
  validates_presence_of :sale_date
  validates_presence_of :invoice
  
  #associatons
  belongs_to :solicitation
  has_many :sale_items, :dependent => :delete_all
  
end
