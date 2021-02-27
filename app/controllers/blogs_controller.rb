class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_blog_auteur, only: [:new, :create, :edit, :update, :show]
  before_action :set_sidebar_niveaus

  layout "blog"
  access all: [:show, :index], user: {except: [:destroy, :create, :edit, :update, :new, :toggle_status]}, site_admin: :all, professeur: [:index, :show,:create, :edit, :update, :new], censeur: [:index, :show,:create, :edit, :update, :new], principale: [:index, :show,:create, :edit, :update, :new], proviseur: [:index, :show,:create, :edit, :update, :new]

  # GET /blogs
  # GET /blogs.json
  def index
    if logged_in?(:site_admin)
      @author = "admin"
      @blogs = Blog.all.recent.page(params[:page]).per(3)
    elsif logged_in?(:professeur, :censeur, :proviseur, :principale) and current_user.authors.empty?
      @blogs = Blog.owner(current_user).page(params[:page]).per(3)
      #@blogs = Blog.published.page(params[:page]).per(3)
      @message_empty = "Vous n'avez pas encore saisi un cours. Pour en saisir veuillez completer votre inscription svp!"
      @author = "Empty"
    elsif logged_in?(:professeur) and !current_user.authors.empty?
      @blogs = Blog.owner(current_user).page(params[:page]).per(3)
      @message_exist = "La liste de vos cours"
      @author = "Exist"

    elsif logged_in?(:censeur) and !current_user.authors.empty?
      @blogs = Blog.owner(current_user).page(params[:page]).per(3)
      @message_exist = "La liste de vos cours"
      @author = "Exist"

    elsif logged_in?(:proviseur) and !current_user.authors.empty?
      @blogs = Blog.owner(current_user).page(params[:page]).per(3)
      @message_exist = "La liste de vos cours"
      @author = "Exist"

    elsif logged_in?(:principale) and !current_user.authors.empty?
      @blogs = Blog.owner(current_user).page(params[:page]).per(3)
      @message_exist = "La liste de vos cours"
      @author = "Exist"

    else
      @blogs = Blog.published.recent.page(params[:page]).per(3)
      @test = 'nothing else'
    end
    @page_title = "Mes cours"
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin, :professeur, :censeur, :proviseur, :principale) || @blog.published?
      #@blog = Blog.includes(:comments).friendly.find(params[:id])
      #@comment = Comment.new
      @blog = Blog.friendly.find(params[:id])
      #pry
      @page_title = @blog.title
      @seo_keywords = @blog.body
    else
      redirect_to blogs_path, notice:"Vous n'êtes pas autorisé à acceder à cette page"
    end
    
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    #@privileges = Privileges.all
    #pry
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Le cours a été créé avec succés' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Le cours a été modifié avec succés.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Le cours a été supprimé avec succés.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @blog.draft?
      @blog.published!
    elsif @blog.published?
      @blog.draft!
    end
        
    redirect_to blogs_url, notice: 'Le statut du cours a été modifié avec succés.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body, :status,:author_id, :domaine_id, :niveau_id, :image, :filiere_id ) #, :author_id, :user_id
    end

    #def set_sidebar_topics
     # @side_bar_topics = Topic.with_blogs
    #end

    def set_sidebar_niveaus
      @set_sidebar_niveaus = Niveau.all
    end

    def set_blog_auteur
      @user = current_user
    end
end
