class ReservationsController < ApplicationController

  def welcome
    
  end

  def index
    @reservations = Reservation.all.order(start_at: :asc)
  end
  
end
