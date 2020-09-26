class Region < ApplicationRecord
  belongs_to :country
  
  has_many :regions, dependent: :destroy
  has_many :ouvrier, dependent: :destroy
  has_many :Responszone

  validates_presence_of :name, :country_id 

end
