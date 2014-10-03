module Admin::RecordsHelper

  # FIXME: try to make the details into table as below
  # 
  # <table>
  #   <thead>
  #     <tr>
  #       <th> 項目 </th>
  #       <th> 單價 </th>
  #       <th> 時數 </th>
  #       <th> 小計 </th>
  #     </tr>
  #   </thead>
  #   <tbody>
  #     <tr>
  #       <td> "SEI" </td>
  #       <td> number_to_currency(record.org.identity.sei_fee, precision: 0) </td>
  #       <td> number_to_human(record.sei_hr, units: {unit: "hrs"}) </td>
  #       <td> number_to_currency(record.sei_price, precision: 0) </td>
  #     </tr>
  #   </tbody>
  # </table>
  
  def sei_price_detail(record)
    if record.sei_hr != 0
      number_to_currency(record.org.identity.sei_fee, precision: 0) + 
      ' * ' + 
      number_to_human(record.sei_hr, units: {unit: "hrs"}) + 
      ' = ' + 
      number_to_currency(record.sei_price, precision: 0) + 
      ' (SEI)'
    end
  end

  def sei_eds_price_detail(record)
    if record.sei_eds_hr != 0
      number_to_currency(record.org.identity.sei_eds_fee, precision: 0) + 
      ' * ' + 
      number_to_human(record.sei_eds_hr, units: {unit: "hrs"}) +
      ' = ' + 
      number_to_currency(record.sei_eds_price, precision: 0) + 
      ' (SEI + EDS)'
    end
  end

  def sei_ebsd_price_detail(record)
    if record.sei_ebsd_hr != 0
      number_to_currency(record.org.identity.sei_ebsd_fee, precision: 0) + 
      ' * ' + 
      number_to_human(record.sei_ebsd_hr, units: {unit: "hrs"}) + 
      ' = ' + 
      number_to_currency(record.sei_ebsd_price, precision: 0) + 
      ' (SEI + EBSD)'
    end
  end

  def sei_eds_ebsd_price_detail(record)
    if record.sei_eds_ebsd_hr != 0
      number_to_currency(record.org.identity.sei_eds_ebsd_fee, precision: 0) + 
      ' * ' + 
      number_to_human(record.sei_eds_ebsd_hr, units: {unit: "hrs"}) +
      ' = ' + 
      number_to_currency(record.sei_eds_ebsd_price, precision: 0) +
      ' (SEI + EDS + EBSD)'
    end
  end

end