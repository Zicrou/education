class Ouvrier < ApplicationRecord
    belongs_to :metier
    belongs_to :domaine
    belongs_to :region
    belongs_to :departement
    
    validates_presence_of :name, :prenom, :telephone, :adresse, :metier_id, :domaine_id, :region_id, :departement_id
end
