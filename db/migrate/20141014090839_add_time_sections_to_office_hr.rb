class AddTimeSectionsToOfficeHr < ActiveRecord::Migration
  def change
    add_column :office_hrs, :date, :date
    add_column :office_hrs, :time_00_09, :integer, :default => 1
    add_column :office_hrs, :time_09_12, :integer, :default => 3
    add_column :office_hrs, :time_12_14, :integer, :default => 2
    add_column :office_hrs, :time_14_17, :integer, :default => 3
    add_column :office_hrs, :time_17_20, :integer, :default => 1
    add_column :office_hrs, :time_20_24, :integer, :default => 1
  end
end