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

  def edit
    @member = @org.members.find(params[:id])
  end

  def update
    @member = @org.members.find(params[:id])

    if @member.update(member_params)
      redirect_to account_members_path, :notice => '編輯使用者成功！'
    else
      render :edit  
    end
  end

  def remove_from_org
    @member = @org.members.find(params[:id])

    @member.org_id = 13
    @member.identity_id = 6
    @member.save
    redirect_to account_members_path, :alert => '使用者已刪除！'
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