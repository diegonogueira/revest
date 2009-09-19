class Representative < ActiveRecord::Base
   
  #validates
  validates_presence_of :name
  validates_presence_of :cnpj_cpf
#  validates_uniqueness_of :name  
  
  #associations
  has_many :dependent_representatives, :dependent => :delete_all
  has_and_belongs_to_many :price_lists
  has_and_belongs_to_many :carriers
  has_many :customers, :dependent => :delete_all
  has_many :solicitations, :dependent => :delete_all
  
  #nested attributes
  accepts_nested_attributes_for :dependent_representatives, :allow_destroy => true,
                                :reject_if => proc { |s| s['name'].blank?}  
  
end
