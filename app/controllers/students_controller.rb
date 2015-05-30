class StudentsController < ApplicationController

  before_action :set_student, only: [:edit, :update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: t('.success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to students_path, notice: t('.success')
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :register_number)
  end

  def set_student
    @student = Student.find(params[:id])
  end
end