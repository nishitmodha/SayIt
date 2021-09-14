class AddRoomIdToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :room, index: true
  end
end
