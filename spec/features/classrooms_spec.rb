require 'rails_helper'

describe ClassroomsController do

  context 'create' do
    before do
      @student = create :student
      @course = create :course
      visit root_path
      click_link 'Estudantes'
      click_link 'Matricular'
    end

    it 'applying a student to a course' do
      select @course.name, from: 'classroom_course_id'
      click_button 'Criar Matricula'

      expect(@student.courses.last).to eq(@course)
      expect(current_path).to eq(student_classrooms_path(@student))
      expect(page).to have_content('Matricula efetuada com sucesso!')
    end

    it 'applying a student withou a course' do
      click_button 'Criar Matricula'

      expect(@student.courses).to be_empty
      expect(page).to have_content('Curso não pode ficar em branco')
    end
  end

  context 'edit' do
    before do
      @classroom = create :classroom
      @course = create :course, name: 'Second course'
    end

    it 'editing a classroom' do
      visit root_path
      click_link 'Estudantes'
      click_link 'Matriculas'
      click_link 'Editar'

      select @course.name, from: 'classroom_course_id'
      
      expect { click_button 'Atualizar Matricula' }.to(
        change { @classroom.reload.course }.from(@classroom.course).to(@course)
      )
      expect(current_path).to eq(student_classrooms_path(@classroom.student))
      expect(page).to have_content('Matricula atualizada com sucesso')
    end
  end
end