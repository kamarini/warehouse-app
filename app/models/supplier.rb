class Supplier < ApplicationRecord
  validates :corporate_name,
    :brand_name,
    :full_address,
    :city,
    :state, 
    :email, 
    presence: true

  validates :registration_number, 
    uniqueness: true,
    length: { is: 13 },
    presence: true
end