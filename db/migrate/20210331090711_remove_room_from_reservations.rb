class RemoveRoomFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_reference :reservations, :room, null: false, foreign_key: true
  end
end
