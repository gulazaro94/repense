require 'rails_helper'

describe StudentsController do

  context 'create' do
    before do
      visit root_path
      click_link 'Estudantes'
      click_link 'Cadastrar novo'
    end

    it 'with valid data' do
      new_name = 'New Student Name'
      fill_in 'Nome', with: new_name
      fill_in 'Numero de registro', with: '123456'
      click_button 'Criar Estudante'

      expect(current_path).to eq(students_path)
      expect(page).to have_content('Estudante criado com sucesso!')
      expect(Student.last.name).to eq(new_name)
    end

    it 'with invalid data' do
      click_button 'Criar Estudante'

      expect(page).to have_content('Nome não pode ficar em branco')
      expect(Student.all).to be_empty
    end
  end

  context 'edit' do

    before do
      @student = create :student
      visit root_path
      click_link 'Estudantes'
      click_link 'Editar'
    end

    it 'with valid data' do
      edited_name = 'Edited Student Name'
      edited_register_number = '654321'

      fill_in 'Nome', with: edited_name
      fill_in 'Numero de registro', with: edited_register_number
      click_button 'Atualizar Estudante'

      expect(current_path).to eq(students_path)
      expect(page).to have_content('Estudante atualizado com sucesso!')
      expect(@student.reload.name).to eq(edited_name)
      expect(@student.register_number).to eq(edited_register_number)
    end

    it 'with invalid data' do
      fill_in 'Nome', with: ''
      click_button 'Atualizar Estudante'

      expect(page).to have_content('Nome não pode ficar em branco')
    end
  end
end