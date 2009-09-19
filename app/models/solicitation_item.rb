class SolicitationItem < ActiveRecord::Base
  
  #validations
  validates_presence_of :product_id
  validates_presence_of :price_list_id
  
  #associations
  belongs_to :solicitation
  belongs_to :product
  belongs_to :price_list
  
end
