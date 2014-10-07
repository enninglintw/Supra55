class Reservation < ActiveRecord::Base

  belongs_to :member
  belongs_to :time_section

  validates_presence_of :start_at, :end_at

  def sum_hr
    (self.end_at - self.start_at) / 3600
  end

end
