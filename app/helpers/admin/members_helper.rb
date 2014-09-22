module Admin::MembersHelper

  def hide_member_name(member)
    # member.name.gsub(member.name, "***")
    if member.name.size > 4
      member.name.gsub(/([a-z])+/, '*')
    elsif member.name.size == 4
      member.name[0,1] + 
      member.name[1,1].gsub(/./, '*') +
      member.name[2,1] +
      member.name[3,1].gsub(/./, '*')
    elsif member.name.size == 3
      member.name[0,1] + 
      member.name[1,1].gsub(/./, '*') +
      member.name[2,1]
    elsif member.name.size == 2
      member.name[0,1] + 
      member.name[1,1].gsub(/./, '*')
    end
  end

end
