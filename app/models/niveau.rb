class Niveau < ApplicationRecord
	has_many :seris
	has_many :matieres
	has_many :students
	has_many :filieres
	has_many :blogs

	validates_presence_of :name,  :abbrege
	def self.with_blogs
  	#includes(:blogs).where.not(blogs: {id: nil})
  end
end
