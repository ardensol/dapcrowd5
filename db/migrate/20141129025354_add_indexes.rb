class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :referrals, :user_id
  	add_index :referred_records, [:user_id, :referral_id, :affiliate_id], name: 'index_referred_record_on_u_r_a'
  end


end
