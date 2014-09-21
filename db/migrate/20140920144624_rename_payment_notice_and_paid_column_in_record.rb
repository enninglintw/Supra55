class RenamePaymentNoticeAndPaidColumnInRecord < ActiveRecord::Migration
  def change
    rename_column :records, :payment_notice? , :payment_notice
    rename_column :records, :paid? , :paid
  end
end
