class Org < ActiveRecord::Base
  belongs_to :identity
  has_many :members
  has_many :records
  
  validates :name, :presence => true
end
