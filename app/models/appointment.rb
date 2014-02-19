class Appointment < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :user
  belongs_to :pet

  attr_accessible :date, :pet_id, :user_id, :reminder, :reason, :id

  validates :date, presence: true
  validate :date_cannot_be_in_the_past
  validates :pet_id, presence: true
  validates :user_id, presence: true
  validates :reason, presence: true 

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if
      date < Date.today
  end
end
