class Addfakeorderstomigratiion < ActiveRecord::Migration
  def change
  	add_column :campaigns, :fake_order, :integer
  end
end
