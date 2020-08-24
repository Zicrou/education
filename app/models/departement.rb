class Departement < ApplicationRecord
  belongs_to :region
  has_many :ouvriers
  

end
