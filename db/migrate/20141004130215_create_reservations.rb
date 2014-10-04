class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :section_type
      t.integer :member_id

      t.timestamps
    end
    add_index :reservations, :member_id
  end
end
