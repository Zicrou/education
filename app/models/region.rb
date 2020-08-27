class Region < ApplicationRecord
  belongs_to :country
  
  has_many :ouvrier, dependent: :destroy

  validates_presence_of :name, :country_id 
end
