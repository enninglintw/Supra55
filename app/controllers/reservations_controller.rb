class ReservationsController < ApplicationController

  def welcome
  end

  def index
    @reservations = Reservation.all.order(start_at: :asc)
    @filtered_reservation = Reservation.build_collection(Date.today.end_of_month.day - Date.today.beginning_of_month.day + 1)
  end

  # GET /reservations/new?time_id=aa
  # link_to(new_reservation_path(time_id: 'aa'), 'Link to new')
  def new
    @time_id = params[:time_id]
    @reservation = Reservation.new(start_at: params[:date], end_at: params[:date])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.member_id = current_user.member.id
    # FIXME: figure out how to decide section_type
    @reservation.section_type = "undefined"

    if @reservation.save
      redirect_to reservations_path, :notice => '新增預約成功！'
    else
      # QUESTION Eddie: why?
      @time_id = params[:time_id]
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update(reservation_params)
      redirect_to reservations_path, :notice => '編輯預約成功！'
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, :alert => '預約已刪除！'
  end


  private

  def reservation_params
    params.require(:reservation).permit(:start_at,
                                        :end_at,
                                        :bei,
                                        :eds,
                                        :ebsd)
  end
  
end
