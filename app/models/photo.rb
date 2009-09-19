class Photo < ActiveRecord::Base
  
  #validates
  validates_presence_of :image_file_name
  validates_presence_of :image_updated_at
  validates_presence_of :image_content_type
  validates_presence_of :image_file_size
#  validates_presence_of :photograph_id
#  validates_presence_of :photograph_type
  
  #associations
  belongs_to :photograph, :polymorphic => true
  
  #upload
  has_attached_file :image,
	:styles => {:original => '600x400>', :thumb => '100x67#'},
	:path => ":rails_root/public/images/upload/:class/:id/:style_:basename.:extension",
	:url => "/images/upload/:class/:id/:style_:basename.:extension"  
  
end
