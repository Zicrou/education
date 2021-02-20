class Domaine < ApplicationRecord
    belongs_to :filiere
    #belongs_to :blog


    validates_presence_of :name, :filiere_id, :niveau_id
end
