class Ouvrier < ApplicationRecord
    belongs_to :metier
    belongs_to :domaine
    belongs_to :region
    belongs_to :departement
    
    validates_presence_of :name, :prenom, :telephone, :adresse, :metier_id, :domaine_id, :region_id, :departement_id

    def self.filtrer(intitule,id)
        Ouvrier.all.where(intitule+_id: id)
    end

    def self.filtrer_by_domaine(id)
        Ouvrier.all.where(domaine_id: id)
    end

    def self.filtrer_by_region(id)
        Ouvrier.all.where(region_id: id)
    end

    def self.filtrer_by_metier(id)
        Ouvrier.all.where(metier_id: id)
    end

    def self.filtrer_by_departement(id)
        Ouvrier.all.where(departement_id: id)
    end

end
