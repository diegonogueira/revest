class Product < ActiveRecord::Base
  
  #validates
  validates_presence_of :name
  validates_presence_of :line_id
  
  #associations
  belongs_to :line
  has_many :photos, :as => :photograph, :dependent => :delete_all
  has_many :solicitation_items, :dependent => :delete_all
  

  #nested attributes
  accepts_nested_attributes_for :photos, :allow_destroy => true,
                                :reject_if => proc { |s| s['image'].blank?}
end
