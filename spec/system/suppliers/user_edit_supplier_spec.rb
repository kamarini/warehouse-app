require 'rails_helper'

describe 'Usuário edita um fornecedor' do
  it 'a partir da página de detalhes' do
    #Arrange
    supplier = Supplier.create(corporate_name: 'Mondelez', brand_name: 'Lacta',
                                registration_number: '3456543000199', 
                                full_address: 'Endereço, 500',
                                city: 'Rio de Janeiro', state: 'RJ', 
                                email: 'lacta@mondelez.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Lacta'
    click_on 'Editar'

    #Assert
    expect(page).to have_content 'Editar Fornecedor'
    expect(page).to have_field('Nome da Empresa', with: 'Mondelez')
    expect(page).to have_field('Marca', with: 'Lacta')
    expect(page).to have_field('CNPJ', with: '3456543000199')
    expect(page).to have_field('Endereço', with: 'Endereço, 500')
    expect(page).to have_field('Cidade', with: 'Rio de Janeiro')
    expect(page).to have_field('Estado', with: 'RJ')
    expect(page).to have_field('E-mail', with: 'lacta@mondelez.com.br')
  end

  it 'com sucesso' do
    #Arrange
    supplier = Supplier.create(corporate_name: 'Mondelez', brand_name: 'Lacta',
                                registration_number: '3456543000199', 
                                full_address: 'Endereço, 500',
                                city: 'Rio de Janeiro', state: 'RJ', 
                                email: 'lacta@mondelez.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Lacta'
    click_on 'Editar'
    fill_in 'Nome da Empresa', with: 'Nestlé'
    fill_in 'Endereço', with: 'Av do chocolate, 700'
    fill_in 'Cidade', with: 'São Paulo'
    fill_in 'Estado', with: 'SP'
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Fornecedor atualizado com sucesso'
    expect(page).to have_content 'Nestlé'
    expect(page).to have_content 'Endereço: Av do chocolate, 700 - São Paulo - SP'
  end

  it 'e mantém os campos obrigatórios' do
    #Arrange
    supplier = Supplier.create!(corporate_name: 'Mondelez', brand_name: 'Lacta',
                                registration_number: '3456543000199', 
                                full_address: 'Endereço, 500',
                                city: 'Rio de Janeiro', state: 'RJ', 
                                email: 'lacta@mondelez.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'Lacta'
    click_on 'Editar'
    fill_in 'Nome da Empresa', with: ''
    fill_in 'Endereço', with: ''
    fill_in 'Cidade', with: ''
    click_on 'Enviar'

    #Assert
    expect(page).to have_content 'Não foi possível atualizar o fornecedor.'
  end
end