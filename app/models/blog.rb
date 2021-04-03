class Blog < ApplicationRecord
  enum status:{draft: 0, published: 1}
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :niveau_id, :domaine_id, :filiere_id, :user_id, :tag_list #, :author_id,
  #belongs_to :topic, optional: true
  belongs_to :author, optional: true
  belongs_to :niveau
  belongs_to :seri, optional: true
  belongs_to :matiere, optional: true
  belongs_to :filiere
  belongs_to :domaine
  belongs_to :user
  
  #has_many :blog_domaines
  #has_many :domaines, :through => :blog_domaines
  has_many :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  has_one_attached :image
  #mount_uploader :image, BlogUploader

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end
  
  def tag_list=(tags_string)
    #tags.join(", ")
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_found_tags
  end

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
