class RemoveIdentityIdFromMemberAndRecord < ActiveRecord::Migration
  def change
    remove_index :members, column: :identity_id
    remove_column :members, :identity_id
    remove_index :records, column: :identity_id
    remove_column :records, :identity_id
  end
end