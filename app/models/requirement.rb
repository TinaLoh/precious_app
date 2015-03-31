class Requirement < ActiveRecord::Base
  belongs_to :client, dependent: :destroy
end
