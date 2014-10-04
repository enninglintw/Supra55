class Reservation < ActiveRecord::Base
  belongs_to :member

  validates_presence_of :start_at, :end_at
end
