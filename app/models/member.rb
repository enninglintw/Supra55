class Member < ActiveRecord::Base
  belongs_to :org

  validates :name, :presence => true
end
