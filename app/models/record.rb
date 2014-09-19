class Record < ActiveRecord::Base
  belongs_to :identity
  belongs_to :org
  belongs_to :member

  validates :sei_hr, :presence => true
  validates :sei_eds_hr, :presence => true
  validates :sei_ebsd_hr, :presence => true
  validates :sei_eds_ebsd_hr, :presence => true
end
