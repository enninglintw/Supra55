class Admin::MembersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @members = Member.all.order(org_id: :desc)
  end

  def new
    @member = Member.new
    @options = Org.all.collect do |org|
      [org.name, org.id]
    end
    @license_status = ['不具學習資格', '未學習操作', '已學習操作', '已考照', '？']
  end

  def create
    @member = Member.new(member_params)
    
    if @member.save
      if @member.org.identity_id != 1
        @member.sei = '不具學習資格'
        @member.eds = '不具學習資格'
        @member.ebsd = '不具學習資格'
        @member.save
      end
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

    if @member.org.identity_id != 1
      @license_status = ['不具學習資格']
    else
      @license_status = ['不具學習資格', '未學習操作', '已學習操作', '已考照', '？']
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
                                   :email,
                                   :org_id,
                                   :sei,
                                   :eds,
                                   :ebsd)
  end
end
