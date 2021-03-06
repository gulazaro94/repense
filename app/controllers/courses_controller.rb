class CoursesController < ApplicationController

  before_action :set_course, only: [:edit, :update]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, notice: t('.success')
    else
      render :new
    end
  end

  def edit
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to courses_path, notice: t('.success')
    else
      render :edit
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end