class Member < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :records

  validates_presence_of :name, :org_id

  # validates :sei, inclusion: { in: ["不具學習資格", "未學習操作", "已學習操作", "已考照"] }
end