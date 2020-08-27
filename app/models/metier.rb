class Metier < ApplicationRecord
    belongs_to :domaine

    validates_presence_of :name, :domaine_id
end
