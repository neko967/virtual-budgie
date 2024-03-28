class AddPosToWords < ActiveRecord::Migration[7.1]
  def change
    add_column :words, :pos, :string, null: false
  end
end
