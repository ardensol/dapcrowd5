class AddReferrals < ActiveRecord::Migration
  def change
  	create_table :referrals do |t|
      t.string :code
      t.integer :user_id
  	end

  end
  
end
