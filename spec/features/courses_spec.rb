require 'rails_helper'

describe CoursesController do

  context 'create' do
    before do
      visit root_path
      click_link 'Cursos'
      click_link 'Cadastrar novo'
    end

    it 'with valid data' do
      new_name = 'Computer Science Course'
      fill_in 'Nome', with: new_name
      fill_in 'Descrição', with: 'A ruby on rails computer science course'
      click_button 'Criar Curso'

      expect(current_path).to eq(courses_path)
      expect(page).to have_content('Curso criado com sucesso!')
      expect(Course.last.name).to eq(new_name)
    end

    it 'with invalid data' do
      click_button 'Criar Curso'

      expect(page).to have_content('Nome não pode ficar em branco')
      expect(Course.all).to be_empty
    end
  end

  context 'edit' do

    before do
      @course = create :course
      visit root_path
      click_link 'Cursos'
      click_link 'Editar'
    end

    it 'with valid data' do
      edited_name = 'Edited Course Name'
      edited_description = '654321'

      fill_in 'Nome', with: edited_name
      fill_in 'Descrição', with: edited_description
      click_button 'Atualizar Curso'

      expect(current_path).to eq(courses_path)
      expect(page).to have_content('Curso atualizado com sucesso!')
      expect(@course.reload.name).to eq(edited_name)
      expect(@course.description).to eq(edited_description)
    end

    it 'with invalid data' do
      fill_in 'Nome', with: ''
      click_button 'Atualizar Curso'

      expect(page).to have_content('Nome não pode ficar em branco')
    end
  end
end