class Budgy < ApplicationRecord
  enum type: { normal: 1, opaline: 2, rainbow: 3 }
end
