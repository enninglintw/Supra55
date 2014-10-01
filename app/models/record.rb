class Record < ActiveRecord::Base
  belongs_to :org
  belongs_to :member
  
  validates_presence_of :sei_hr, 
                        :sei_eds_hr, 
                        :sei_ebsd_hr, 
                        :sei_eds_ebsd_hr

  # def self.sum_price_of_the_member
  #   records.inject(0) {|sum, record| sum + record.sum_price }
  # end
end
