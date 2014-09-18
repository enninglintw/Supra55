class Identity < ActiveRecord::Base
  has_many :orgs
  has_many :members
  has_many :records
end
