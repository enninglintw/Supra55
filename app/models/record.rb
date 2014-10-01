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
    if self.original_price >= 6000
      self.org.identity.discount_above_60k
    elsif self.original_price >= 4000
      self.org.identity.discount_above_40k
    elsif self.original_price >= 3000
      self.org.identity.discount_above_30k
    else
      100
    end
  end

  def sum_price
    self.original_price * self.discount / 100
  end

  def sum_price_of_the_member
    "累計金額"
  end

  # FIXME: 算年度總價
  # def self.sum_price_of_the_member
  #   records.inject(0) {|sum, record| sum + record.sum_price }
  # end
end
