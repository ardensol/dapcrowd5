class Addshippingtocampaign < ActiveRecord::Migration
   def change
  	add_column :campaigns, :shirt, :boolean
  	add_column :campaigns, :shipping, :decimal
  	add_column :payments, :shirt_size, :string
  end
end
