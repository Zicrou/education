class ResponszonesController < ApplicationController
  before_action :set_responszone, only: [:show, :edit, :update, :destroy] 
  before_action :responszone_user, only: [:responszone_user_id]
  access [:user, :respons_zone, :professeur, :principale, :censeur, :proviseur] => {except: [:index, :destroy, :create, :edit, :update, :new, :show]}, site_admin: :all, trusted: [:index, :create, :edit, :update, :new, :show, {except: [:destroy]}]
  
  layout 'general-layout'
#Le Controller Pour Definir Un Responsable De Zone Avec ses Cordonnées Aprés Qu'Il S'Est Inscrit
  # GET /responszones
  def index
    @responszones = Responszone.all
  end

#Customs Methods

  def responszone_user_id 
    @responszone_user = params[:responszone][:user_responszone] 
    session[:responszone_user] = @responszone_user
    #pry
    redirect_to new_responszone_path()
  end

  def filtered
    @region = params[:regionId]
    @domaine = params[:domaineId]
    if !@region.nil?
      @departements = Departement.where(region_id:@region)
      puts "region= "+ @region
      respond_to do |format|
        format.json { render json: @departements }
      end

    elsif !@domaine.nil?
      @metiers = Metier.where(domaine_id:@domaine)
      puts "domaine= "+ @domaine
      respond_to do |format|
        format.json { render json: @metiers }
      end
    end
    #render :index
    
  end

  # GET /responszones/1
  def show
    @user_responszone = User.find_by_id(@responszone.user_responszone)
    #pry
  end

  # GET /responszones/new
  def new
    @departements = Departement.all
    @responszone = Responszone.new
    
    #pry
  end

  # GET /responszones/1/edit
  def edit
  end

  # POST /responszones
  def create
    @responszone = Responszone.new(responszone_params)
    @responszone.user_id = current_user.id
    @responszone.user_responszone = session[:responszone_user]

    #pry
    if @responszone.save
      redirect_to @responszone, notice: 'Responszone was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /responszones/1
  def update
    @responszone.user_id = current_user.id
    if @responszone.update(responszone_params)
      redirect_to @responszone, notice: 'Responszone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /responszones/1
  def destroy
    @responszone.destroy
    redirect_to responszones_url, notice: 'Responszone was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responszone
      @responszone = Responszone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def responszone_params
      params.require(:responszone).permit(:telephone, :cni, :photocni, :photo, :user_id, :country_id, :region_id, :departement_id, :user_responszone)
    end

    # Params For Responszone_user_id
    def responszone_user
      params.require(:responszone).permit(:user_responszone)
    end
end
