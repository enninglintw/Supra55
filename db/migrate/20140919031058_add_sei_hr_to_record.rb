class AddSeiHrToRecord < ActiveRecord::Migration
  def change
    add_column :records, :sei_hr, :float
    add_column :records, :sei_eds_hr, :float
    add_column :records, :sei_ebsd_hr, :float
    add_column :records, :sei_eds_ebsd_hr, :float
    add_column :records, :payment_notice?, :boolean
    add_column :records, :paid?, :boolean
    add_column :records, :note, :text
  end
end
