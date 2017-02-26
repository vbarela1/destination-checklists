class Checklist < ApplicationRecord

  belongs_to :destination
  has_many :items
end
