class CarrierPriceList < ActiveRecord::Base
  
  #validations
  validates_presence_of :name
  
  #associations
  belongs_to :carrier
  
end
