class Client < ActiveRecord::Base

  has_many :particularities
  has_many :requirements

  accepts_nested_attributes_for :particularities, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :requirements, :reject_if => :all_blank, :allow_destroy => true

  validates :first_name, :last_name, :image, :description, :age, :gender, :location, :guardian, presence: true
  
  has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
