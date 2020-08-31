class Niveau < ApplicationRecord
	has_many :seris
	has_many :matieres
	has_many :students

	validates_presence_of :name,  :abbrege
	def self.with_blogs
  	#includes(:blogs).where.not(blogs: {id: nil})
  end
end
