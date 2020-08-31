class Seri < ApplicationRecord
  belongs_to :niveau
  has_many   :matieres
  has_many   :students

  validates_presence_of :name, :niveau_id

end
