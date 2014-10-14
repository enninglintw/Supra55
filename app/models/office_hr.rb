class OfficeHr < ActiveRecord::Base
  as_enum :time_00_09,  off_duty: 1
  as_enum :time_09_12,  off_duty: 1, break_time: 2, in_duty: 3
  as_enum :time_12_14,  off_duty: 1, break_time: 2
  as_enum :time_14_17,  off_duty: 1, break_time: 2, in_duty: 3
  as_enum :time_17_20,  off_duty: 1
  as_enum :time_20_24,  off_duty: 1
end