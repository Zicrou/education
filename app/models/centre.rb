class Centre < ApplicationRecord
    has_many :juris
    has_many :students

    belongs_to :departement
    
    validates_presence_of :numcentre, :departement_id
end
