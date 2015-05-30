class Student < ActiveRecord::Base

  ACTIVE_STATUS = 1
  INACTIVE_STATUS = 2

  has_many :classrooms
  has_many :courses, through: :classrooms

  validates :name, :register_number, presence: true, length: { maximum: 45}
  validates :register_number, uniqueness: true

end
