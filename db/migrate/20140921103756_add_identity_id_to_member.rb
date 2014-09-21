class AddIdentityIdToMember < ActiveRecord::Migration
  def change
    add_column :members, :identity_id, :integer
    add_index :members, :identity_id
    add_index :members, :org_id
  end
end
