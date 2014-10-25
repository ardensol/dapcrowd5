class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :name
      t.attachment :image
      t.boolean :show
      t.string :description

      t.timestamps
    end
  end
end
