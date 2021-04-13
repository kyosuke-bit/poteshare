class ReservationsController < ApplicationController
  
  def index
    # @reservations = Reservation.all
    @reservations = current_user.reservations.all
  end
  
  def confirm_new
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :total_amount, :user_id, :room_id, :room_name, :room_introduction, :image))
    render :room_path unless @reservation.valid?
    
    @reservation.total_amount = @reservation.room.price * @reservation.number_of_people * ((@reservation.end_date - @reservation.start_date).to_i)
    
  end
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :total_amount, :user_id, :room_id, :room_name, :room_introduction, :image))

    if params[:back].present?
      redirect_to rooms_path
      return
    end
     
    @reservation.save!
      flash.notice = "予約が完了しました"
      redirect_to root_path
  end
  
  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to reservations_url, notice: "予約「#{reservation.id}を削除しました。」"
  end
  
end
