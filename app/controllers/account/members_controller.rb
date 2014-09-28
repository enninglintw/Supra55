class Account::MembersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_org

  def index
    @members = @org.members
  end

  def new
    @member = @org.members.new
  end

  def create
    @member = @org.members.new(member_params)

    if @member.save
      redirect_to account_members_path, :notice => '新增使用者成功！'
    else
      render :new
    end
  end


  private

  def find_org
    @org = Org.find_by(id: current_user.member.org_id)
  end

  def member_params
    params.require(:member).permit(:name,
                                   :tel,
                                   :email)
  end

end