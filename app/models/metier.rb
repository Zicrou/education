class Metier < ApplicationRecord
    belongs_to :domaine
    belongs_to :user

    validates_presence_of :name, :domaine_id, :user_id
end
