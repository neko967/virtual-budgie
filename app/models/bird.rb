class Bird < ApplicationRecord
  enum bird_type: { ノーマル: 1, オパーリン: 2, レインボー: 3 }
  has_many :user_having_birds
end
