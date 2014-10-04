class AddBeiEdsEbsdToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :sei, :boolean, :default => true
    add_column :reservations, :bei, :boolean
    add_column :reservations, :eds, :boolean
    add_column :reservations, :ebsd, :boolean
  end
end
