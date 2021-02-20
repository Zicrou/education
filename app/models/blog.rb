class Blog < ApplicationRecord
  enum status:{draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :author_id, :niveau_id, :domaine_id, :filiere_id
  #belongs_to :topic, optional: true
  belongs_to :author, optional: true
  belongs_to :niveau
  belongs_to :seri, optional: true
  belongs_to :matiere, optional: true
  belongs_to :filiere
  
  has_many :domaine
  has_many :comments, dependent: :destroy

  mount_uploader :image, BlogUploader

  def self.special_blogs
  	all
  end

  def self.featured_blogs
  	limit(3)
  end

  def self.recent
    order("created_at DESC")
  end

  def self.owner(user)
    Blog.all.where(author_id: user.authors.ids)
  end

  def prov_princens
    Blog.all.where(author_id: user.authors.ids)
  end
  #if logged_in?(:professeur) and current_user.id.authors.empty? #for User with no authors 
end
