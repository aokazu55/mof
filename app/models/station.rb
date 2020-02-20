class Station < ApplicationRecord
  validates :line, presence: false
  validates :station, presence: false
  validates :minute, presence: false

  belongs_to :house
end
