require 'rails_helper'

describe 'Usuário remove um galpão' do
  it 'com sucesso' do
    #Arrange
    w = Warehouse.create!(name: 'Cuiabá', code: 'CWB', area: '10000', cep: '56000-000',
                          address: 'Avenida dos Jacarés, 1000', city: 'Cuiabá', 
                          description: 'Galpão no centro do país' )
    #Act
    visit root_path
    click_on 'Cuiabá'
    click_on 'Remover'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso.'
    expect(page).not_to have_content 'Cuiabá'
    expect(page).not_to have_content 'CWB'
  end

  it 'e não apaga outros galpões' do
    #Arrange
    first_warehouse = Warehouse.create!(name: 'Cuiabá', code: 'CWB', area: '10000', cep: '56000-000',
                          address: 'Avenida dos Jacarés, 1000', city: 'Cuiabá', 
                          description: 'Galpão no centro do país' )
    second_warehouse = Warehouse.create!(name: 'Belo Horizonte', code: 'BHZ', area: '20000', 
                          cep: '46000-000',address: 'Avenida Tiradentes, 220', 
                          city: 'Belo Horizonte', description: 'Galpão para cargas mineiras' )
    #Act
    visit root_path
    click_on 'Cuiabá'
    click_on 'Remover'

    #Assert
    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão removido com sucesso.'
    expect(page).not_to have_content 'Cuiabá'
    expect(page).to have_content 'Belo Horizonte'
  end
end