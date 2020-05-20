class Niveau < ApplicationRecord

	def self.with_blogs
  	includes(:blogs).where.not(blogs: {id: nil})
  end
end
