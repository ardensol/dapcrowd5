class AddProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.decimal :height
      t.integer :weight
      t.text 	:about
      t.string 	:location
      t.string  :byline
      t.decimal :savings

      t.boolean :blogger
      t.boolean :vendor
      t.boolean :moderator


      t.timestamps
    end
  end
end
