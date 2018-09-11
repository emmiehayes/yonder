class ActivityPin < ApplicationRecord
  belongs_to :activity
  belongs_to :pin
end
