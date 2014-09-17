class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :org_id
      t.string :tel
      t.boolean :education_permitted
      t.boolean :educated_for_sei
      t.boolean :license_for_sei

      t.timestamps
    end
  end
end
