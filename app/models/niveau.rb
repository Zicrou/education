class Niveau < ApplicationRecord
	has_many :seris
	has_many :matieres
	def self.with_blogs
  	#includes(:blogs).where.not(blogs: {id: nil})
  end
end
