class Carrier < ActiveRecord::Base
  
  #validates
  validates_presence_of :name
  
  #associations
  has_and_belongs_to_many :representatives
  has_many :carrier_price_lists, :dependent => :delete_all
  
  #nested attributes
  accepts_nested_attributes_for :carrier_price_lists, :allow_destroy => true,
                                :reject_if => proc { |s| s['region'].blank?}  
  
end
