class SaleItem < ActiveRecord::Base
  
  #validations
  validates_presence_of :sale_id
  validates_presence_of :solicitation_item_id
  
  #associations
  belongs_to :sale
  belongs_to :solicitation_item
  
end
