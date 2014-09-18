class AddMemberIdToRecord < ActiveRecord::Migration
  def change
    add_column :records, :member_id, :integer
  end
end
