class AddOrgIdToRecord < ActiveRecord::Migration
  def change
    add_column :records, :org_id, :integer
  end
end
