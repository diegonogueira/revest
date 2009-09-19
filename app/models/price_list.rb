class PriceList < ActiveRecord::Base
  
  #validates
  validates_presence_of :name
  has_and_belongs_to_many :representatives
  
  #associations
  has_many :solicitation_items, :dependent => :delete_all
  
end
