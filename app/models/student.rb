class Student < ApplicationRecord
    belongs_to :etablissement

    validates_presence_of :nom, :prenom, :cni, :telephone, :numtable, :email, :etablissement_id
end
