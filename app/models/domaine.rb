class Domaine < ApplicationRecord
    belongs_to :filiere

    has_many :blogs

    validates_presence_of :name, :filiere_id
end
