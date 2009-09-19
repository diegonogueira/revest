class Line < ActiveRecord::Base
  
  #validates
  validates_presence_of :name
#  validates_uniqueness_of :name
  
  #associations
  has_many :products
  
end
