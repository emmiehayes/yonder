class Activity < ApplicationRecord
  validates_uniqueness_of :title
  has_many :activity_pins
  has_many :pins, through: :activity_pins
end
