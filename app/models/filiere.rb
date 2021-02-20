class Filiere < ApplicationRecord
    belongs_to :niveau
    has_many :blogs

    validates_presence_of :name, :niveau_id
end
