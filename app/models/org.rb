class Org < ActiveRecord::Base
  belongs_to :identity
  has_many :members
  has_many :records
  
  validates :name, :presence => true

  def sum_price_of_2014
    # start_at from 2014-01-01 before 2015-01-01
    self.records.where('start_at >= (2014-01-01)').sum(:sum_price)
  end
end
