class Home < ApplicationRecord
  validates :name, presence: true, length:{maximum:30}
  validates :rent, presence: true
  validates :address, presence: true, length:{maximum:50}
  validates :year, presence: true

  has_many:stations, dependent: :destroy
  accepts_nested_attributes_for :stations, allow_destroy: true
end
