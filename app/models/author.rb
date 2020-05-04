class Author < ApplicationRecord
  belongs_to :user
  belongs_to :etablissement
  belongs_to :matiere
end
