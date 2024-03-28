class Vocab < ApplicationRecord
  belongs_to :pet

  def increase_frequency
    self.frequency += 1
    save
  end
end
