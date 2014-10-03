module Account::MembersHelper

  def hide_member_name_from_members(member)
    # FIXME: hide part of the infos, rewrite the code
    # FIXME: ask if this can be writen in model
    member.name.gsub(member.name, "***")
    # member.name.gsub(/([a-z])+/, '*')
    # if member.name.size > 4
    #   member.name.gsub(/([a-z])+/, '*')
    # elsif member.name.size == 4
    #   member.name[0,1] + 
    #   member.name[1,1].gsub(/./, '*') +
    #   member.name[2,1] +
    #   member.name[3,1].gsub(/./, '*')
    # elsif member.name.size == 3
    #   member.name[0,1] + 
    #   member.name[1,1].gsub(/./, '*') +
    #   member.name[2,1]
    # elsif member.name.size == 2
    #   member.name[0,1] + 
    #   member.name[1,1].gsub(/./, '*')
    # end
  end

end