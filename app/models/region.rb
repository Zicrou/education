class Region < ApplicationRecord
  belongs_to :country
  
  has_many :ouvrier, dependent: :destroy
end
