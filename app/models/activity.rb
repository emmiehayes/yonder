class Activity < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :high, :low, :sky
end
