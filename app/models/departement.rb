class Departement < ApplicationRecord
  belongs_to :region
  belongs_to :user
  has_many :ouvriers
  has_many :centres
  has_many :Responszone
  

  validates_presence_of :name, :region_id, :user_id

  def Departement_by_region(id)
    where(region_id:id)
  end
end
