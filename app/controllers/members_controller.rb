class MembersController < ApplicationController

  def new
    @org = Org.find(params[:org_id])
    @member = @org.members.new
  end

  def create
    @org = Org.find(params[:org_id])
    @member = @org.members.new(member_params)

    if @member.save
      redirect_to org_path(@org), :notice => '新增使用者成功！'
    else
      render :new
    end
  end


  private

  def member_params
    params.require(:member).permit(:name, :tel, :education_permitted, :educated_for_sei, :license_for_sei)
  end

end
