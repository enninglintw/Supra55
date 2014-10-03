class AddSeiEdsEbsdToMember < ActiveRecord::Migration
  def change
    add_column :members, :sei, :string
    add_column :members, :eds, :string
    add_column :members, :ebsd, :string
    remove_column :members, :education_permitted
    remove_column :members, :educated_for_sei
    remove_column :members, :license_for_sei
  end
end
