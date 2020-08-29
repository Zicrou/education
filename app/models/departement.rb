class Departement < ApplicationRecord
  belongs_to :region
  has_many :ouvriers
  

  validates_presence_of :name, :region_id

  def Departement_by_region(id)
    where(region_id:id)
  end
end
