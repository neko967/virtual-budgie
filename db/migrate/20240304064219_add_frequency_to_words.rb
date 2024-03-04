class AddFrequencyToWords < ActiveRecord::Migration[7.1]
  def change
    add_column :words, :frequency, :integer, default: 0, null: false
  end
end
