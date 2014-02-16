class Pet < ActiveRecord::Base
  self.inheritance_column = nil

  belongs_to :user

  attr_accessible :name, :type, :breed, :age, :weight, :date

  validates :name, presence: true
  validates :name, length: { maximum: 35 }
  validates :type, presence: true
  validate :type_is_dog_or_cat
  validates :breed, presence: true
  validates :breed, length: { maximum: 35 }
  validates :age, presence: true
  validates :weight, presence: true
  validats :date, presence: true

  def type_is_dog_or_cat
    type == 'dog' || type == 'cat'
  end
end
