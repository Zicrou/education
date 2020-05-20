class Matiere < ApplicationRecord
  belongs_to :niveau
  belongs_to :seri
  has_many   :blogs
end
