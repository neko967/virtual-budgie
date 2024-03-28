class CreateVocabs < ActiveRecord::Migration[7.1]
  def change
    create_table :vocabs do |t|
      t.string :word,       null: false
      t.integer :frequency, null: false, default: 0
      t.string :pos,        null: false
      t.references :pet,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
