class Activity < ApplicationRecord
  validates_uniqueness_of :title
  has_many :trails
  has_many :shops
end