class Region < ApplicationRecord
  belongs_to :country
  
  has_many :departements, dependent: :destroy
  has_many :ouvrier, dependent: :destroy
  has_many :responszones

  validates_presence_of :name, :country_id 

  # Methode Determinant Region En Fonction Du Responsable
  def by_respons_zone(id_responszone)
      Region.all.where(id: id_responszone)
  end


end
