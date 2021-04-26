class AddRoomsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_name, :string
    add_column :reservations, :room_introduction, :text
    add_column :reservations, :image, :string
  end
end
