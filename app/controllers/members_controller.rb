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

  def edit
    @org = Org.find(params[:org_id])
    @member = @org.members.find(params[:id])
  end

  def update
    @org = Org.find(params[:org_id])
    @member = @org.members.find(params[:id])

    if @member.update(member_params)
      redirect_to org_path(@org), :notice => '編輯使用者成功！'
    else
      render :edit
    end
  end

  def destroy
    @org = Org.find(params[:org_id])
    @member = @org.members.find(params[:id])

    @member.destroy
    redirect_to org_path(@org), :alert => '使用者已刪除！'
  end


  private

  def member_params
    params.require(:member).permit(:name, :tel, :education_permitted, :educated_for_sei, :license_for_sei)
  end

end
