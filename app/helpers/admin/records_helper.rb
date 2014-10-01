module Admin::RecordsHelper

  def org_name(record)
    record.org.name
  end

  def identity_classificaion(record)
    record.org.identity.classification
  end

  def render_record_start_at(record)
    record.start_at.to_s(:db)
  end

  def render_record_end_at(record)
    record.end_at.to_s(:db)
  end

  def sum_hr(record)
    if (record.end_at - record.start_at) / 3600 == 
    (record.sei_hr + 
    record.sei_eds_hr + 
    record.sei_ebsd_hr + 
    record.sei_eds_ebsd_hr)
      record.sei_hr + 
      record.sei_eds_hr + 
      record.sei_ebsd_hr + 
      record.sei_eds_ebsd_hr
    else
      "使用時數不符！"
    end
  end

  def sei_price(record)
    record.org.identity.sei_fee * record.sei_hr
  end

  def sei_eds_price(record)
    record.org.identity.sei_eds_fee * record.sei_eds_hr
  end

  def sei_ebsd_price(record)
    record.org.identity.sei_ebsd_fee * record.sei_ebsd_hr
  end

  def sei_eds_ebsd_price(record)
    record.org.identity.sei_eds_ebsd_fee * record.sei_eds_ebsd_hr
  end

  def original_price(record)
    sei_price(record) + 
    sei_eds_price(record) +
    sei_ebsd_price(record) +
    sei_eds_ebsd_price(record)
  end

  def discount(record)
    if original_price(record) >= 6000
      record.org.identity.discount_above_60k
    elsif original_price(record) >= 4000
      record.org.identity.discount_above_40k
    elsif original_price(record) >= 3000
      record.org.identity.discount_above_30k
    else
      1
    end
  end

  def sum_price(record)
    original_price(record) * discount(record)
  end

  def sum_price_of_the_member(record)
    "累計金額"
  end

end
