class MembersController < ApplicationController

  before_action :find_org

  def new
    @member = @org.members.new
  end

  def create
    @member = @org.members.new(member_params)

    if @member.save
      redirect_to org_path(@org), :notice => '新增使用者成功！'
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
      redirect_to org_path(@org), :notice => '編輯使用者成功！'
    else
      render :edit
    end
  end

  def destroy
    @member = @org.members.find(params[:id])

    @member.destroy
    redirect_to org_path(@org), :alert => '使用者已刪除！'
  end


  private

  def member_params
    params.require(:member).permit(:name, :tel, :education_permitted, :educated_for_sei, :license_for_sei)
  end

  def find_org
    @org = Org.find(params[:org_id])
  end

end
