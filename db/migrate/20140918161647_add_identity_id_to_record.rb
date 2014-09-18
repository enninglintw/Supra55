class AddIdentityIdToRecord < ActiveRecord::Migration
  def change
    add_column :records, :identity_id, :integer
  end
end
