class Record < ActiveRecord::Base
  belongs_to :org
  belongs_to :member
  
  validates_presence_of :sei_hr, 
                        :sei_eds_hr, 
                        :sei_ebsd_hr, 
                        :sei_eds_ebsd_hr

  def org_name
    self.org.name
  end

  def identity_classificaion
    self.org.identity.classification
  end

  def sum_hr
    if (self.end_at - self.start_at) / 3600 == 
      (self.sei_hr + self.sei_eds_hr + self.sei_ebsd_hr + self.sei_eds_ebsd_hr)
      self.sei_hr + self.sei_eds_hr + self.sei_ebsd_hr + self.sei_eds_ebsd_hr
    else
      "使用時數不符！"
    end
  end

  def sei_price
    self.org.identity.sei_fee * self.sei_hr
  end

  def sei_eds_price
    self.org.identity.sei_eds_fee * self.sei_eds_hr
  end

  def sei_ebsd_price
    self.org.identity.sei_ebsd_fee * self.sei_ebsd_hr
  end

  def sei_eds_ebsd_price
    self.org.identity.sei_eds_ebsd_fee * self.sei_eds_ebsd_hr
  end

  def original_price
    self.sei_price + 
    self.sei_eds_price +
    self.sei_ebsd_price +
    self.sei_eds_ebsd_price
  end

  def discount
    if self.annually_sum_price_before_this_record < 30000
      100
    elsif self.annually_sum_price_before_this_record.between?(30000, 40000-1)
      self.org.identity.discount_above_30k
    elsif self.annually_sum_price_before_this_record.between?(40000, 60000-1)
      self.org.identity.discount_above_40k
    else
      self.org.identity.discount_above_60k
    end
  end

  # def sum_price
  #   self.original_price * self.discount / 100
  # end

  # FIXME: start_at from 2014-01-01 before record.start_at
  # start_at: (self.start_at.beginning_of_year)..(self.start_at - 1.minute)
  def annually_sum_price_before_this_record
    # Record.where(start_at: (self.start_at.beginning_of_year)..(self.start_at - 1.minute), 
    #              org_id: self.org_id).inject(0) { |sum, record| sum + record.sum_price }
    Record.where(start_at: (self.start_at.beginning_of_year)..(self.start_at - 1.minute), 
                 org_id: self.org_id).sum(:sum_price)
  end

  def annually_sum_price_until_this_record
    # Record.where(start_at: (self.start_at.beginning_of_year)..(self.start_at), 
    #              org_id: self.org_id).inject(0) { |sum, record| sum + record.sum_price }
    Record.where(start_at: (self.start_at.beginning_of_year)..(self.start_at), 
                 org_id: self.org_id).sum(:sum_price)
  end

  def annually_sum_price
    # Record.where(start_at: (self.start_at.beginning_of_year)..(self.start_at.end_of_year), 
    #              org_id: self.org_id).inject(0) { |sum, record| sum + record.sum_price }
    Record.where(start_at: (self.start_at.beginning_of_year)..(self.start_at.end_of_year), 
                 org_id: self.org_id).sum(:sum_price)
  end

end
