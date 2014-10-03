class Account::MembersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_org

  def show
    @member = @org.members.find(params[:id])
    @records = @member.records
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