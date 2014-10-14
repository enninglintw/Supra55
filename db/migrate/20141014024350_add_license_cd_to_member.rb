class AddLicenseCdToMember < ActiveRecord::Migration
  def change
    add_column :members, :sei_bei_license_cd, :integer
    add_column :members, :eds_license_cd,     :integer
    add_column :members, :ebsd_license_cd,    :integer
    remove_column :members, :sei
    remove_column :members, :eds
    remove_column :members, :ebsd
  end
end
