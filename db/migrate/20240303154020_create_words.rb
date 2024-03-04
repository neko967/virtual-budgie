class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words do |t|
      t.string :word, null: false
      t.integer :frequency, default: 0, null: false
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
