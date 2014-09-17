class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.string :classification
      t.integer :sei_fee
      t.integer :sei_eds_fee
      t.integer :sei_ebsd_fee
      t.integer :sei_eds_ebsd_fee
      t.float :discount_above_30k
      t.float :discount_above_40k
      t.float :discount_above_60k

      t.timestamps
    end
  end
end
