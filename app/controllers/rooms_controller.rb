class RoomsController < ApplicationController

  def index
    @rooms = @q.result(distinct: true).recent
  end
  
  def show
    @room = Room.find(params[:id])
    @user = User.find(session[:user_id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = current_user.rooms.new(room_params)

    if @room.save
      redirect_to @room, notice: "「#{@room.room_name}」を追加しました"
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    room = Room.find(params[:id])
    room.update!(room_params)
    redirect_to rooms_url, notice:"「#{room.room_name}」を更新しました。"
  end
  
  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_url, notice: "「#{room.room_name}」を削除しました。"
  end

  def posts
    @rooms = current_user.rooms
  end

  private
  
  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :price, :adress, :image)
  end
  
end
