class AddSumPriceToRecord < ActiveRecord::Migration
  def change
    add_column :records, :sum_price, :float
  end
end
