class AddReferredRecord < ActiveRecord::Migration
  def change
  	create_table :referred_records do |t|
      t.integer :user_id
      t.integer :referral_id
      t.integer :affiliate_id
    end
  end
end
