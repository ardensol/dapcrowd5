class Addretailpricetocampaigns < ActiveRecord::Migration
  def change
  	add_column :campaigns, :retail_price, :decimal
  end
end
