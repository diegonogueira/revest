class Solicitation < ActiveRecord::Base
   
  #associations
  belongs_to :representative
  belongs_to :customer
  has_many :solicitation_items, :dependent => :delete_all
  has_many :sales, :dependent => :delete_all
  
  #nested attributes
  accepts_nested_attributes_for :solicitation_items, :allow_destroy => true,
                                :reject_if => proc { |s| s['price'].blank? }    
  
end
