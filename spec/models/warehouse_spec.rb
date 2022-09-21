require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when name is empty' do
        #Arrange
        warehouse = Warehouse.new(name: '', code: 'RIO', address: 'Endereço', cep: 23444-444,
                                  city: 'Rio de Janeiro', area: 1000, 
                                  description: 'Alguma descrição')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when code is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio de Janeiro', code: '', address: 'Endereço', cep: 23444-444,
                                  city: 'Rio de Janeiro', area: 1000, 
                                  description: 'Alguma descrição')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when address is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: '', cep: 23444-444,
                                  city: 'Rio de Janeiro', area: 1000, 
                                  description: 'Alguma descrição')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when cep is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço', cep: '',
                                  city: 'Rio de Janeiro', area: 1000, 
                                  description: 'Alguma descrição')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when city is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço', cep: 23444-444,
                                  city: '', area: 1000, 
                                  description: 'Alguma descrição')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when area is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço', cep: 23444-444,
                                  city: 'Rio de Janeiro', area: '', 
                                  description: 'Alguma descrição')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when description is empty' do
        #Arrange
        warehouse = Warehouse.new(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço', cep: 23444-444,
                                  city: 'Rio de Janeiro', area: 1000, 
                                  description: '')
        #Act
        result = warehouse.valid?
        #Assert
        expect(result).to eq false
      end
    end

    it 'false when code is already in use' do
      #Arrange
      first_warehouse = Warehouse.create(name: 'Rio de Janeiro', code: 'RIO', address: 'Endereço', 
                                        cep: 23444-444, city: 'Rio de Janeiro', area: 1000, 
                                        description: 'Alguma descrição')
      second_warehouse = Warehouse.new(name: 'Niteroi', code: 'RIO', address: 'Avenida', 
                                      cep: 23444-444, city: 'Rio', area: 500, 
                                      description: 'Outra descrição')

      #Act
      result = second_warehouse.valid?

      #Assert
      expect(result).to eq false
    end
  end
end
