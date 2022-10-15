require 'rails_helper'

describe 'Usuário vê detalhes do fornecedor' do
  it 'a partir da tela inicial' do
    #Arrange
    Supplier.create!(corporate_name: 'ACME Ltda', brand_name: 'ACME',
                    registration_number: '43556644000177', full_address: 'Av das Palmas, 100',
                    city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    #Assert
    expect(page).to have_content('ACME Ltda')
    expect(page).to have_content('Documento: 43556644000177')
    expect(page).to have_content('Endereço: Av das Palmas, 100 - Bauru - SP')
    expect(page).to have_content('E-mail: contato@acme.com.br')
  end

  it 'e volta para a tela inicial' do
    #Arrange
    Supplier.create!(corporate_name: 'ACME Ltda', brand_name: 'ACME',
                    registration_number: '43556644000177', full_address: 'Av das Palmas, 100',
                    city: 'Bauru', state: 'SP', email: 'contato@acme.com.br')
    #Act
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Voltar'
    #Assert
    expect(current_path).to eq root_path
  end
end