class Course < ActiveRecord::Base

  has_many :classrooms
  has_many :students, through: :classrooms

  validates :name, :description, presence: true, length: { maximum: 45}
end
