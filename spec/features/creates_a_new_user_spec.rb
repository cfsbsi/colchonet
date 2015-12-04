require 'rails_helper'

feature 'Create a new User' do
  scenario 'successfully' do
    visit new_user_path

    name = 'Christian Franco'
    email = 'cfs.bsi@gmail.com'
    location = 'Sorocaba-SP'
    password = '123456'
    bio = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

    fill_in 'Nome completo', with: name
    fill_in 'Localização', with: location
    fill_in 'E-mail', with: email
    fill_in 'Senha', with: password
    fill_in 'Confirme sua senha', with: password
    fill_in 'Biografia', with: bio
    click_button 'Create Usuário'

    expect(page).to have_content name
    expect(page).to have_content location
    expect(page).to have_content bio
  end

  scenario 'bio length should be bigger than 29' do
    visit new_user_path

    name = 'Christian Franco'
    email = 'cfs.bsi@gmail.com'
    location = 'Sorocaba-SP'
    password = '123456'
    bio = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

    fill_in 'Nome completo', with: name
    fill_in 'Localização', with: location
    fill_in 'E-mail', with: email
    fill_in 'Senha', with: password
    fill_in 'Confirme sua senha', with: password
    fill_in 'Biografia', with: bio
    click_button 'Create Usuário'

    expect(page).to have_content 'Há erro no formulário, por favor verifique.'
  end
end
