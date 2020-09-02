class Etablissement < ApplicationRecord
  has_many :students

  belongs_to :departement

  validates_presence_of :name, :adresse, :departement_id
end
