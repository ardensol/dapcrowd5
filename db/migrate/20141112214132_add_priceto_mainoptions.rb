class AddPricetoMainoptions < ActiveRecord::Migration
  def change
    add_column :mainoptions, :estimated_price, :decimal
    add_column :mainoptions, :number_of_backers, :integer
  end
end
