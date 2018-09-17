class Activity < ApplicationRecord
  validates_uniqueness_of :title
end