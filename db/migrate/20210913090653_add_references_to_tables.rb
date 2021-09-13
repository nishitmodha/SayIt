class AddReferencesToTables < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :message, index: true
    add_reference :rooms, :user, index: true
    add_reference :messages, :user, index: true
  end
end
