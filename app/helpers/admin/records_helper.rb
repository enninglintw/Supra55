module Admin::RecordsHelper

  def org_name(record)
    record.member.org.name
  end

  def identity_classificaion(record)
    record.member.org.identity.classification
  end

  def sum_hr(record)
    # (record.end_at - record.start_at) / 3600
    record.sei_hr + 
    record.sei_eds_hr + 
    record.sei_ebsd_hr + 
    record.sei_eds_ebsd_hr
  end

  def sei_price(record)
    record.member.org.identity.sei_fee * record.sei_hr
  end

  def sei_eds_price(record)
    record.member.org.identity.sei_eds_fee * record.sei_eds_hr
  end

  def sei_ebsd_price(record)
    record.member.org.identity.sei_ebsd_fee * record.sei_ebsd_hr
  end

  def sei_eds_ebsd_price(record)
    record.member.org.identity.sei_eds_ebsd_fee * record.sei_eds_ebsd_hr
  end

  def original_price(record)
    record.member.org.identity.sei_fee * record.sei_hr + 
    record.member.org.identity.sei_eds_fee * record.sei_eds_hr +
    record.member.org.identity.sei_ebsd_fee * record.sei_ebsd_hr +
    record.member.org.identity.sei_eds_ebsd_fee * record.sei_eds_ebsd_hr
  end

  def discount(record)
    if original_price(record) >= 6000
      record.member.org.identity.discount_above_60k
    elsif original_price(record) >= 4000
      record.member.org.identity.discount_above_40k
    elsif original_price(record) >= 3000
      record.member.org.identity.discount_above_30k
    else
      1
    end
  end

  def sum_price(record)
    original_price(record) * discount(record)
  end

end
