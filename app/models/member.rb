class Member < ActiveRecord::Base
  belongs_to :identity
  belongs_to :org
  has_many :records

  validates :name, :presence => true
end
