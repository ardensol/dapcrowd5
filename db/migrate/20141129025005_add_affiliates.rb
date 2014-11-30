class AddAffiliates < ActiveRecord::Migration
  	def change
		create_table :affiliates do |t|
	      t.string :name
	      t.string :path
	    end
	end
end
