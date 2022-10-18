require 'rails_helper'

describe 'Usuário cadastra um fornecedor' do
  it 'a partir do menu' do
    #Arrange

    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'

    #Assert
    expect(page).to have_field('Nome da Empresa')
    expect(page).to have_field('Marca')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('E-mail')
  end

  it 'com sucesso' do
    #Arrange

    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Marca', with: 'ACME'
    fill_in 'Nome da Empresa', with: 'ACME Ltda'
    fill_in 'CNPJ', with: '4355664400017'
    fill_in 'Endereço', with: 'Av das Palmas, 100'
    fill_in 'Cidade', with: 'Bauru'
    fill_in 'Estado', with: 'SP'
    fill_in 'E-mail', with: 'contato@acme.com.br'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content('Fornecedor cadastrado com sucesso')
    expect(page).to have_content('ACME Ltda')
    expect(page).to have_content('Documento: 4355664400017')
    expect(page).to have_content('Endereço: Av das Palmas, 100 - Bauru - SP')
    expect(page).to have_content('E-mail: contato@acme.com.br')
  end

  it 'com dados incompletos' do
    #Arrange

    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'
    fill_in 'Marca', with: ''
    fill_in 'Nome da Empresa', with: ''
    fill_in 'CNPJ', with: ''
    fill_in 'E-mail', with: ''
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Fornecedor não cadastrado.'
    expect(page).to have_content 'Marca não pode ficar em branco'
    expect(page).to have_content 'Nome da Empresa não pode ficar em branco'
    expect(page).to have_content 'CNPJ não pode ficar em branco'
  end
end