class RoomsController < ApplicationController

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
      room = Room.find(params[:id])
      room.destroy
      redirect_to root_path
  end
  
  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end