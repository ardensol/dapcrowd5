class Addamericanflagtousers < ActiveRecord::Migration
  def change
    add_column :profiles, :buysamerican, :boolean
  end
end
