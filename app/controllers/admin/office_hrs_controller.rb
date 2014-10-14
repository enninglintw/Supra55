class Admin::OfficeHrsController < AdminController

  def index
    @office_hrs = OfficeHr.all
  end

  def new
    @office_hr = OfficeHr.new
  end

  def create
    @office_hr = OfficeHr.new(office_hr_params)

    if @office_hr.save
      redirect_to admin_office_hrs_path, :notice => '新增上班時段成功！'
    else
      render :new
    end
  end

  def edit
    @office_hr = OfficeHr.find(params[:id])
  end

  def update
    @office_hr = OfficeHr.find(params[:id])

    if @office_hr.update(office_hr_params)
      redirect_to admin_office_hrs_path, :notice => '編輯上班時段成功！'
    else
      render :edit
    end
  end

  def destroy
    @office_hr = OfficeHr.find(params[:id])

    @office_hr.destroy
    redirect_to admin_office_hrs_path, :alert => '上班時段已刪除！'    
  end


  private

  def office_hr_params
    params.require(:office_hr).permit(:date,
                                      :time_00_09,
                                      :time_09_12,
                                      :time_12_14,
                                      :time_14_17,
                                      :time_17_20,
                                      :time_20_24)
  end

end
