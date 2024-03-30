class CreateVocabs < ActiveRecord::Migration[7.1]
  def change
    create_table :vocabs do |t|
      t.string :word,       null: false
      t.string :pos,        null: false
      t.integer :frequency, null: false, default: 0
      t.references :pet,    null: false, foreign_key: true

      t.timestamps
    end

    add_index :vocabs, [:pet_id, :word, :pos], unique: true
  end
end
