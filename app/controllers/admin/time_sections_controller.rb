class Admin::TimeSectionsController < AdminController
  
  def index
    @time_sections = TimeSection.all.order(start_at: :asc)
  end

  def new
    @time_section = TimeSection.new
  end

  def create
    @time_section = TimeSection.new(time_section_params)

    if @time_section.save
      redirect_to admin_time_sections_path, :notice => '新增預約時段成功！'
    else
      render :new
    end
  end


  private

  def time_section_params
    params.require(:time_section).permit(:start_at,
                                         :end_at,
                                         :operator_status)
  end

end
