class Appointment < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :user

  attr_accessible :date, :pet, :customer, :reminder, :reason

  validates :date, presence: true
  validate :date_cannot_be_in_the_past
  validates :pet, presence: true
  validates :customer, presence: true
  validates :reason, presence: true 

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if
      expiration_date < Date.today
  end
end
