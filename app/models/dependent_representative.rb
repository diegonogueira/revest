class DependentRepresentative < ActiveRecord::Base
  
  #validates
  validates_presence_of :name
  
  #associations
  belongs_to :representative
  
end
