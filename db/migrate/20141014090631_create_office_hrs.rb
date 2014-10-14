class CreateOfficeHrs < ActiveRecord::Migration
  def change
    create_table :office_hrs do |t|

      t.timestamps
    end
  end
end
