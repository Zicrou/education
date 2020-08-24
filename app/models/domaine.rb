class Domaine < ApplicationRecord
    has_many :metiers, dependent: :destroy
    has_many :ouvriers, dependent: :destroy
end
