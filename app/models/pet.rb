class Pet < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :user
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { maximum: 35 }
  validates :type, presence: true
  validate :type_is_dog_or_cat
  validates :breed, presence: true
  validates :breed, length: { maximum: 35 }
  validates :age, presence: true
  validates :weight, presence: true
  validates :date, presence: true
  validate :date_cannot_be_in_the_future

  def type_is_dog_or_cat
    type == 'dog' || type == 'cat'
  end

  def date_cannot_be_in_the_future
    errors.add(:date, "can't be in the future") if
      date > Date.today
  end
end
