class Author < ApplicationRecord
  belongs_to :user
  belongs_to :etablissement
  belongs_to :matiere

  has_many	 :blogs

  validates_presence_of :telephone, :user_id, :etablissement_id, :matiere_id
end
