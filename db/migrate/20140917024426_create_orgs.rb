class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :name
      t.string :official_name
      t.string :address
      t.string :tel

      t.timestamps
    end
  end
end
