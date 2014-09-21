class AddIndexToRecord < ActiveRecord::Migration
  def change
    add_index :records, :identity_id
    add_index :records, :org_id
    add_index :records, :member_id
  end
end
