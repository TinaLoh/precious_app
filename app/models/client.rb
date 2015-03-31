class Client < ActiveRecord::Base
  belongs_to :user

  has_many :particularities, dependent: :destroy
  has_many :requirements, dependent: :destroy

  accepts_nested_attributes_for :particularities, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :requirements, :reject_if => :all_blank, :allow_destroy => true

  validates :first_name, :last_name, :image, :description, :age, :gender, :location, :guardian, presence: true

  has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  # It returns the clients whose names contain one or more words that form the query
  def self.search(query)
    # where(:first_name, query) -> This would return an exact match of the query
    where("first_name like ?", "%#{query}%")
  end

end
