class AddTimeSectionsToOfficeHr < ActiveRecord::Migration
  def change
    add_column :office_hrs, :date, :date
    add_column :office_hrs, :time_00_09_cd, :integer, :default => 1
    add_column :office_hrs, :time_09_12_cd, :integer, :default => 3
    add_column :office_hrs, :time_12_14_cd, :integer, :default => 2
    add_column :office_hrs, :time_14_17_cd, :integer, :default => 3
    add_column :office_hrs, :time_17_20_cd, :integer, :default => 1
    add_column :office_hrs, :time_20_24_cd, :integer, :default => 1
  end
end