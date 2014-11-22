class Reservation < ActiveRecord::Base

  split_date_time :start_at
  split_date_time :end_at

  belongs_to :member
  belongs_to :time_section

  validates_presence_of :start_at, :end_at

  validate :valid_avaliable_date_time

  def sum_hr
    (self.end_at - self.start_at) / 3600
  end

  def self.start_time_select(time_id)
    {
      1 => ( 0.. 9-1).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      2 => ( 9..12-1).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      3 => (12..14-1).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      4 => (14..17-1).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      5 => (17..20-1).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      6 => (20..24-1).map { |i| "#{i.to_s.rjust(2, "0")}:00" }
    }[time_id.to_i]
  end

  def self.end_time_select(time_id)
    {
      1 => ( 0+1.. 9).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      2 => ( 9+1..12).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      3 => (12+1..14).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      4 => (14+1..17).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      5 => (17+1..20).map { |i| "#{i.to_s.rjust(2, "0")}:00" },
      6 => (20+1..24).map { |i| "#{i.to_s.rjust(2, "0")}:00" }
    }[time_id.to_i]
  end

  # Collection = Struct.new(:date, :reservations)
  # enables to write "Collection.first.date" & "Collection.first.reservations"?
  # define a nested class under Reservation called Collection
  Collection = Struct.new(:date, :reservations)
  # Create a new Class called Collection with columns called date & reservations

  def self.build_collection(day)
    (1..day).map { |day| 
      date = Date.today.beginning_of_month + (day-1).days
      Collection.new(date, date_filter(date))
    }
  end

  scope :date_filter, -> (day) {
    if day.is_a?(Date)
      where("start_at >= ? AND start_at < ?", day, day + 1.day)
    else
      raise "Require a date object: #{day} for #{day.class}"
    end
  }

  # scope :time_filter, -> (time) {
  #   if time.is_a?(Time)
  #     where("start_at >= ? AND start_at < ?", 9:00, 12:00)
  #   else
  #     raise "Require a time object: #{time} for #{time.class}"
  #   end
  # }

  # Order => Items
  # @order = Order.find(1)

  # use ||= to assign a value if nil, or cache value
  # def total_amount
  #   @total_amount ||= items.map { |item| item.price * item.qty }.sum
  # end

  protected

  def valid_avaliable_date_time
    hr = OfficeHr.where(date: start_at_date).first
    if hr.blank?
      errors.add(:start_at_time, :invalid)
    elsif hr.is_time_avaliable?(start_at)
      errors.add(:start_at_time, :invalid)
    end
  end

end