class Admin::RecordsController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @records = Record.all
  end

  def new
    @record = Record.new
    @options = Member.all.collect do |member|
      [member.name, member.id]
    end
  end

  def create
    @record = Record.new(record_params)

    if @record.save
      redirect_to admin_records_path, :notice => '新增使用記錄成功！'
    else
      render :new
    end
  end


  private

  def record_params
    params.require(:record).permit(:start_at,
                                   :end_at,
                                   :member_id)
  end
end
