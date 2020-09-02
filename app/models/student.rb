class Student < ApplicationRecord
    belongs_to :etablissement
    belongs_to :centre
    belongs_to :niveau
    belongs_to :seri
    #belongs_to :departement, optional: true
    #belongs_to :region, optional: true

    validates_presence_of :nom, :prenom, :cni, :telephone, :numtable, :email, :etablissement_id, :niveau_id, :seri_id, :juri_id, :centre_id
end
