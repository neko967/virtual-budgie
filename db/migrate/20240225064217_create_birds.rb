class CreateBirds < ActiveRecord::Migration[7.1]
  def change
    create_table :birds do |t|
      t.integer :bird_type  , null: false
      t.text :description   , null: false
      t.string :bird_image

      t.timestamps
    end
  end
end
