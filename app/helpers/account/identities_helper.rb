module Account::IdentitiesHelper

  # FIXME: DRY
  # @items = ["sei", "sei_eds", "sei_ebsd", "sei_eds_ebsd"]
  # @licenses = ["sei", "eds", "ebsd"]

  # in views
  # <tbody>
  #   <% @cafes.each do |cafe| %>
  #     <tr>
  #       <td><%= link_to cafe.name, cafe %></td>
  #       <td><%= link_to cafe.address, "http://maps.google.com/?q=#{cafe.name}|#{cafe.address}", :target => "_blank" %></td>
  #       <td><%= cafe.tel %></td>
  #     <% @days.each do |day| %>
  #       <% if cafe.send("#{day}_holiday") %>
  #         <td class="text-center" colspan="3"> 公休日 </td>
  #       <% end %>
  #     <% end %>
  #     </tr>
  #   <% end %>
  # </tbody>

end
