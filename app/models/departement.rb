class Departement < ApplicationRecord
  belongs_to :region
  has_many :ouvriers
  

  validates_presence_of :name, :region_id
end
