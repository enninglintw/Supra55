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
    # @records = @member.records
  end


  private

  def member_params
    params.require(:member).permit(:name,
                                    :tel,
                                    :education_permitted,
                                    :educated_for_sei,
                                    :license_for_sei)
  end
end
