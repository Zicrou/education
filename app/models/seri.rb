class Seri < ApplicationRecord
  belongs_to :niveau
  has_many   :matieres
end
