class AddItemToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :item, :string
  end
end
