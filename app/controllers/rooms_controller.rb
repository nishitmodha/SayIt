class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = current_user.rooms.build
  end

  def edit
  end

  def create
    @room = current_user.rooms.create!(room_params)
    redirect_to @room, notice: 'Room was successfully created.'
  end

  def update
    @room.update!(room_params)
    redirect_to @room, notice: 'Room was successfully updated.'
  end

  def destroy
    @room.destroy
    redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
