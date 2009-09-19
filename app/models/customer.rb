class Customer < ActiveRecord::Base
  
  #validates
  validates_presence_of :name
  validates_presence_of :cnpj_cpf
  
  #associations
  belongs_to :representative
  has_many :solicitations
  
end
