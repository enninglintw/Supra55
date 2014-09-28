class Account::OrgsController < ApplicationController

  before_action :authenticate_user!

  def show
    @org = Org.find_by(id: current_user.member.org_id)
    @members = @org.members
  end

  def edit
    @org = Org.find_by(id: current_user.member.org_id)
  end

  def update
    @org = Org.find_by(id: current_user.member.org_id)

    if @org.update(org_params)
      redirect_to account_org_path(@org), :notice => '編輯使用單位成功！'
    else
      render :edit
    end
  end


  private

  def org_params
    params.require(:org).permit(:name,
                                :official_name,
                                :address,
                                :tel)
  end

end
