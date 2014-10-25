class CreatePrototypes < ActiveRecord::Migration
  def change
    create_table :prototypes do |t|
      t.string :name
      t.attachment :image
      t.boolean :show

      t.timestamps
    end
  end
end
