class Centre < ApplicationRecord
    has_many :juris

    belongs_to :departement
    
    validates_presence_of :numcentre, :departement_id
end
