class OfficeHr < ActiveRecord::Base

  TIME_COLUMN_MAPPER = {
      :time_00_09 => (0..9).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      :time_09_12 => (9..12).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      :time_12_14 => (12..14).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      :time_14_17 => (14..17).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      :time_17_20 => (17..20).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      :time_20_24 => (20..24).map { |i| "#{i.to_s.rjust(2, "0")}:00" }
    }

  as_enum :time_00_09,  uncertain: 0, off_duty: 1
  as_enum :time_09_12,  uncertain: 0, off_duty: 1, break_time: 2, in_duty: 3
  as_enum :time_12_14,  uncertain: 0, off_duty: 1, break_time: 2
  as_enum :time_14_17,  uncertain: 0, off_duty: 1, break_time: 2, in_duty: 3
  as_enum :time_17_20,  uncertain: 0, off_duty: 1
  as_enum :time_20_24,  uncertain: 0, off_duty: 1


  def is_time_avaliable?(datetime)
    return false unless datetime.to_date == date
    TIME_COLUMN_MAPPER.each_with_index do |time_range, column|
      # mass assignment
      range_start, range_end = time_range.first, time_range.last
      datetime_start = "#{date.to_s} #{range_start})".to_time #YYYY-MM-DD 00:00
      datetime_end = "#{date.to_s} #{range_end})".to_time     #YYYY-MM-DD 09:00

      # return false if send(column) == :off_duty
      return false unless datetime_start >= datetime && datetime_end <= datetime
    end

    true
  end

end