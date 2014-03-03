class Pet < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :user
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { maximum: 35 }
  validates :type, presence: true
  validate  :type, :type_is_dog_or_cat
  validates :breed, presence: true
  validates :breed, length: { maximum: 35 }
  validates :age, presence: true
  validates :weight, presence: true
  validates :date, presence: true
  validate  :date, :date_cannot_be_in_the_future

  def type_is_dog_or_cat
    errors.add(:type, "must be a dog or cat") if
    type != 'Dog' && type != 'Cat'
  end

  def date_cannot_be_in_the_future
    errors.add(:date, "can't be in the future") if
      date > Date.today
  end
end
