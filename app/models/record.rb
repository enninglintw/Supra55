class Record < ActiveRecord::Base
  belongs_to :identity
  belongs_to :org
  belongs_to :member

  validates :sei_hr, :presence => true
  validates :sei_eds_hr, :presence => true
  validates :sei_ebsd_hr, :presence => true
  validates :sei_eds_ebsd_hr, :presence => true

  # def self.sum_price_of_the_member
  #   records.inject(0) {|sum, record| sum + record.sum_price }
  # end
end
