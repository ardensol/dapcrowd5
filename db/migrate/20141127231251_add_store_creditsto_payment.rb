class AddStoreCreditstoPayment < ActiveRecord::Migration
  def change
  	add_column :payments, :store_credit_amount, :decimal
  end
end
