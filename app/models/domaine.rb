class Domaine < ApplicationRecord
    belongs_to :filiere
    has_many :blogs
    #has_many :blogs, :through => :blog_domaines

    validates_presence_of :name, :filiere_id, :niveau_id
end
