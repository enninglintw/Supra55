class Org < ActiveRecord::Base
  belongs_to :identity
  has_many :members
  
  validates :name, :presence => true
end
