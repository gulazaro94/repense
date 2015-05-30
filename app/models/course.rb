class Course < ActiveRecord::Base

  ACTIVE_STATUS = 1
  INACTIVE_STATUS = 2

  has_many :classrooms
  has_many :students, through: :classrooms

  validates :name, :description, presence: true, length: { maximum: 45}
end
