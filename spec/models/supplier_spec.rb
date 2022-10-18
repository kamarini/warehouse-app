require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'false when corporate_name is empty' do
        #Arrange
        supplier = Supplier.new(corporate_name: '', brand_name: 'Lacta', 
                                registration_number: '3456543000199',
                                full_address: 'Endereço, 500',
                                city: 'Rio de Janeiro', state: 'RJ', 
                                email: 'lacta@mondelez.com.br')
        #Act
        result = supplier.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when brand_name is empty' do
        #Arrange
        supplier = Supplier.new(corporate_name: 'Mondelez', brand_name: '', 
                                registration_number: '3456543000199',
                                full_address: 'Endereço, 500',
                                city: 'Rio de Janeiro', state: 'RJ', 
                                email: 'lacta@mondelez.com.br')
        #Act
        result = supplier.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when registration_number is empty' do
        #Arrange
        supplier = Supplier.new(corporate_name: 'Mondelez', brand_name: 'Lacta', 
                                registration_number: '',
                                full_address: 'Endereço, 500',
                                city: 'Rio de Janeiro', state: 'RJ', 
                                email: 'lacta@mondelez.com.br')
        #Act
        result = supplier.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when full_address is empty' do
        #Arrange
        supplier = Supplier.new(corporate_name: 'Mondelez', brand_name: 'Lacta', 
                                registration_number: '3456543000199',
                                full_address: '',
                                city: 'Rio de Janeiro', state: 'RJ', 
                                email: 'lacta@mondelez.com.br')
        #Act
        result = supplier.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when city is empty' do
        #Arrange
        supplier = Supplier.new(corporate_name: 'Mondelez', brand_name: 'Lacta',
                                registration_number: '3456543000199',
                                full_address: 'Endereço, 500',
                                city: '', state: 'RJ', 
                                email: 'lacta@mondelez.com.br')
        #Act
        result = supplier.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when state is empty' do
        #Arrange
        supplier = Supplier.new(corporate_name: 'Mondelez', brand_name: 'Lacta', 
                                registration_number: '3456543000199',
                                full_address: 'Endereço, 500',
                                city: 'Rio de Janeiro', state: '', 
                                email: 'lacta@mondelez.com.br')
        #Act
        result = supplier.valid?
        #Assert
        expect(result).to eq false
      end

      it 'false when email is empty' do
        #Arrange
        supplier = Supplier.new(corporate_name: 'Mondelez', brand_name: 'Lacta',
                                registration_number: '3456543000199', 
                                full_address: 'Endereço, 500',
                                city: 'Rio de Janeiro', state: 'RJ', 
                                email: '')
        #Act
        result = supplier.valid?
        #Assert
        expect(result).to eq false
      end
    end

    it 'false when registration_number is already in use' do
      #Arrange
      first_supplier = Supplier.create(corporate_name: 'Mondelez', brand_name: 'Lacta',
                                    registration_number: '3456543000199', 
                                    full_address: 'Endereço, 500',
                                    city: 'Rio de Janeiro', state: 'RJ', 
                                    email: 'lacta@mondelez.com.br')
      second_supplier = Supplier.new(corporate_name: 'Nova Mondelez', brand_name: 'Chocolate',
                                      registration_number: '3456543000199', 
                                      full_address: 'Outro endereço, 800',
                                      city: 'Rio de Janeiro', state: 'RJ', 
                                      email: 'chocolate@mondelez.com.br')
      #Act
      result = second_supplier.valid?

      #Assert
      expect(result).to eq false
    end
  end
end 