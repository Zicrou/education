class Filiere < ApplicationRecord
    #BELONGS TO
    belongs_to :niveau

    #HAS MANY
    has_many :domaines
    has_many :blogs

    validates_presence_of :name, :niveau_id
end
