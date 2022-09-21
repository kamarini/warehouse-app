class Warehouse < ApplicationRecord
  validates :name, :code, :city, :address, :cep, :description, :area, presence: true
  validates :code, uniqueness: true
end
