class AddIndexForIdentityIdToOrg < ActiveRecord::Migration
  def change
    add_index :orgs, :identity_id
  end
end
