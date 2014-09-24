class Member < ActiveRecord::Base
  belongs_to :identity
  belongs_to :org
  has_many :records
  has_one :account, foreign_key: "user_id"

  validates :name, :presence => true
end
