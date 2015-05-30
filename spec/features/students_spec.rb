require 'rails_helper'

describe StudentsController do

  context 'create' do
    before do
      visit root_path
      click_link 'Estudantes'
      click_link 'Cadastrar novo'
    end

    it 'with valid data' do
      student_name = 'New Student Name'
      fill_in 'Nome', with: student_name
      fill_in 'Numero de registro', with: '123456'
      click_button 'Criar Estudante'

      expect(current_path).to eq(students_path)
      expect(page).to have_content('Estudante criado com sucesso!')
      expect(Student.last.name).to eq(student_name)
    end

    it 'with invalid data' do
      click_button 'Criar Estudante'

      expect(page).to have_content('Nome não pode ficar em branco')
      expect(Student.all).to be_empty
    end
  end
end