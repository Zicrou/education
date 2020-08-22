class Ouvrier < ApplicationRecord
    belongs_to :metier
    belongs_to :domaine
    belongs_to :region
    belongs_to :departement
    
    validates_presence_of :name, :prenom, :telephone, :adresse, :metier_id, :domaine_id, :region_id, :departement_id
    
    #by One

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

    #by two

    def self.domaine_metier(domaine, metier)
        Ouvrier.all.where(domaine_id: domaine, metier_id: metier)
    end

    def self.region_departement(region, departement)
        Ouvrier.all.where(region_id: region, departement_id: departement)
    end

    def self.region_domaine
        Ouvrier.all.where(region_id: region, domaine_id: domaine)
    end

    def self.region_metier
        Ouvrier.all.where(region_id: region, metier_id: metier)
    end

    def self.departement_domaine
        Ouvrier.all.where(departement_id: departement, domaine: domaine_id)
    end

    def self.departement_metier
        Ouvrier.all.where(departement_id: departement, metier_id: metier)
    end

    #by three

    def self.region_departement_domaine(region, departement, domaine)
        Ouvrier.all.where(region_id: region, departement_id: departement, domaine_id: domaine)
    end

    def self.region_departement_metier(region, departement, metier)
        Ouvrier.all.where(region_id: region, departement_id: departement, metier_id: metier)
    end

    def self.departement_domaine_metier(departement, domaine, metier)
        Ouvrier.all.where(departement_id: departement, domaine_id: domaine, metier_id: metier)
    end

    #by four
    def self.region_departement_domaine_metier
        Ouvrier.all.where(region_id: region, departement_id: departement, domaine_id: domaine, metier_id: metier)
    end


end
