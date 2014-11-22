class Member < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :records
  has_many :reservations

  validates_presence_of :name, :org_id

  as_enum :sei_bei_license,  ？: 1, 不具學習資格: 2, 未學習操作: 3, 已學習操作: 4, 已考照: 5
  as_enum :eds_license,      ？: 1, 不具學習資格: 2, 未學習操作: 3, 已學習操作: 4, 已考照: 5
  as_enum :ebsd_license,     ？: 1, 不具學習資格: 2, 未學習操作: 3, 已學習操作: 4, 已考照: 5

  def name_with_org_name
    # 串string的不同方法
    # method 1
    [name, ' (', org.name, ')'].join

    # method 2
    # "#{name} (#{org.name})"

    # method 3
    # self.name + " (" + self.org.name + ")"

    # method 4
    # name + " (" + org.name + ")"

    # FIXME: same result, which is better?
    # A: method 1 or 2
  end

end