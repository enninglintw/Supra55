class Admin::MembersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
    @options = Org.all.collect do |org|
      [org.name, org.id]
    end
  end

  def create
    @member = Member.new(member_params)
    
    if @member.save
      redirect_to admin_members_path, :notice => '新增使用者成功！'
    else
      render :new
    end
  end

  def show
    @member = Member.find(params[:id])
    @records = @member.records
  end

  def edit
    @member = Member.find(params[:id])
    @options = Org.all.collect do |org|
      [org.name, org.id]
    end
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      redirect_to admin_members_path, :notice => '編輯使用者成功！'
    else
      render :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])

    @member.destroy
    redirect_to admin_members_path, :alert => '使用者已刪除！'
  end


  private

  def member_params
    params.require(:member).permit(:name,
                                   :tel,
                                   :education_permitted,
                                   :educated_for_sei,
                                   :license_for_sei,
                                   :org_id)
  end
end
