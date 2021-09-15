class MessagesController < ApplicationController
  before_action :set_room, only: %i[ new create ]
  before_action :authenticate_user!

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.build(message_params)
    @message.user = current_user

    respond_to do |format|
      if @message.save
        format.turbo_stream
        format.html { redirect_to @room }
      else
        format.html { redirect_to @room, notice: "YO IT CAN'T BE BLANK DUMBASS"}
      end
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
