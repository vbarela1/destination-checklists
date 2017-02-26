class Destination < ApplicationRecord
  validates_presence_of :name

  belongs_to :traveler
  has_one :checklist

  after_create :create_checklist

  def create_checklist
    checklist = Checklist.new
    checklist.destination_id = self.id
    checklist.save
  end
end
