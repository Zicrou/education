class Blog < ApplicationRecord
  enum status:{draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :author_id, :matiere_id, :seri_id, :niveau_id
  #belongs_to :topic, optional: true
  belongs_to :author, optional: true
  belongs_to :niveau
  belongs_to :seri
  belongs_to :matiere
  has_many :comments, dependent: :destroy

  def self.special_blogs
  	all
  end

  def self.featured_blogs
  	limit(3)
  end

  def self.recent
    order("created_at DESC")
  end
end
