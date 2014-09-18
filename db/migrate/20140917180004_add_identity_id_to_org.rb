class AddIdentityIdToOrg < ActiveRecord::Migration
  def change
    add_column :orgs, :identity_id, :integer
  end
end
