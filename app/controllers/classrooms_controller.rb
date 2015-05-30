class ClassroomsController < ApplicationController

  before_action :set_student
  before_action :set_classroom, only: [:edit, :update]

  def index
    @classrooms = @student.classrooms.includes(:course)
  end

  def new
    @classroom = @student.classrooms.build
    set_courses
  end

  def create
    @classroom = @student.classrooms.build(classroom_params)
    if @classroom.save
      redirect_to student_classrooms_path(@student), notice: t('.success')
    else
      set_courses
      render :new
    end
  end

  def edit
    set_courses
  end

  def update
    if @classroom.update(classroom_params)
      redirect_to student_classrooms_path(@student), notice: t('.success')
    else
      set_courses
      render :edit
    end
  end

  private

  def classroom_params
    params.require(:classroom).permit(:course_id, :entry_at)
  end

  def set_classroom
    @classroom = Classroom.find(params[:id])
  end

  def set_student
    @student = Student.find(params[:student_id])
  end

  def set_courses
    @courses = Course.select(:id, :name)
  end
end