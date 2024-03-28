class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name,               null: false
      t.integer :level,             null: false, default: 1
      t.integer :experience_point,  null: false, default: 0
      t.integer :hungry_score,      null: false, default: 100
      t.boolean :alive,             null: false, default: true
      t.references :user, null: false, foreign_key: true
      t.references :bird, null: false, foreign_key: true

      t.timestamps
    end
  end
end
