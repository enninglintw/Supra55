class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
