class OfficeHr < ActiveRecord::Base

  as_enum :time_00_09,  uncertain: 0, off_duty: 1
  as_enum :time_09_12,  uncertain: 0, off_duty: 1, break_time: 2, in_duty: 3
  as_enum :time_12_14,  uncertain: 0, off_duty: 1, break_time: 2
  as_enum :time_14_17,  uncertain: 0, off_duty: 1, break_time: 2, in_duty: 3
  as_enum :time_17_20,  uncertain: 0, off_duty: 1
  as_enum :time_20_24,  uncertain: 0, off_duty: 1

end