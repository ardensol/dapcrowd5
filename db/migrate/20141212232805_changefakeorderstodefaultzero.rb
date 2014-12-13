class Changefakeorderstodefaultzero < ActiveRecord::Migration
  def change
  	change_column :campaigns, :fake_order, :integer, :default => 0
  end
end
