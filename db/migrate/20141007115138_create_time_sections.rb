class CreateTimeSections < ActiveRecord::Migration
  def change
    create_table :time_sections do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :operator_status

      t.timestamps
    end
  end
end
