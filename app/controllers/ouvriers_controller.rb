class OuvriersController < ApplicationController
  before_action :set_ouvrier, only: [:show, :edit, :update, :destroy]
  access all: [:index], user: {except: [:destroy, :create, :edit, :update, :new, :show]}, site_admin: :all

  #access all: [:show, :index], user: {except: [:destroy, :create, :edit, :update, :new, :toggle_status]}, site_admin: :all, professeur: [:index, :show,:create, :edit, :update, :new], censeur: [:index, :show,:create, :edit, :update, :new], principale: [:index, :show,:create, :edit, :update, :new], proviseur: [:index, :show,:create, :edit, :update, :new]

layout 'general-layout'
  # GET /ouvriers
  def index
    @ouvriers = Ouvrier.all
  end

  def recherche
    @domaine = recherche_params.fetch(:domaine_id)
    @region = recherche_params.fetch(:region_id)
    @departement = recherche_params.fetch(:departement_id)
    @metier = recherche_params.fetch(:metier_id)
    if !@domaine.empty? and @region.empty? and @departement.empty? and @metier.empty?
      @ouvriers = Ouvrier.filtrer_by_domaine(@domaine)

    elsif !@metier.empty? and @domaine.empty? and @region.empty? and @departement.empty?
      @ouvriers = Ouvrier.filtrer_by_metier(@metier)

    elsif !@region.empty? and @metier.empty? and @domaine.empty? and @departement.empty?
      @ouvriers = Ouvrier.filtrer_by_region(@region)

    elsif !@departement.empty? and @metier.empty? and @domaine.empty? and @region.empty?
      @ouvriers = Ouvrier.filtrer_by_departement(@departement)

    elsif @departement.empty? and !@metier.empty? and !@domaine.empty? and @region.empty?
      @ouvriers = Ouvrier.domaine_metier(@domaine, @metier)

    elsif !@region.empty? and !@departement.empty? and @metier.empty? and @domaine.empty?
      @ouvriers = Ouvrier.region_departement(@region, @departement)

    elsif @departement.empty? and @metier.empty? and !@domaine.empty? and !@region.empty?
      @ouvriers = Ouvrier.region_domaine(@region, @domaine)

    elsif @departement.empty? and !@metier.empty? and @domaine.empty? and !@region.empty?
      @ouvriers = Ouvrier.region_metier(@region, @metier)

    elsif !@departement.empty? and @metier.empty? and !@domaine.empty? and @region.empty?
      @ouvriers = Ouvrier.departement_domaine(@departement, @domaine)
    
    elsif !@departement.empty? and !@metier.empty? and @domaine.empty? and @region.empty?
      @ouvriers = Ouvrier.departement_metier(@departement, @metier)

    elsif !@departement.empty? and @metier.empty? and !@domaine.empty? and !@region.empty?
      @ouvriers = Ouvrier.region_departement_domaine(@region, @departement, @domaine)

    elsif !@departement.empty? and !@metier.empty? and @domaine.empty? and !@region.empty?
      @ouvriers = Ouvrier.region_departement_metier(@region, @departement, @metier)

    elsif !@departement.empty? and !@metier.empty? and @domaine.empty? and !@region.empty?
      @ouvriers = Ouvrier.departement_domaine_metier(@departement, @domaine, @metier)

    elsif !@departement.empty? and !@metier.empty? and !@domaine.empty? and !@region.empty?
      @ouvriers = Ouvrier.region_departement_domaine_metier(@region, @departement, @domaine, @metier)
    end
    render :index
    @domaine = ""
    @region = ""
    @departement = ""
    @metier = ""
  end

  # GET /ouvriers/1
  def show
  end

  # GET /ouvriers/new
  def new
    @ouvrier = Ouvrier.new
  end

  # GET /ouvriers/1/edit
  def edit
  end

  # POST /ouvriers
  def create
    @ouvrier = Ouvrier.new(ouvrier_params)

    if @ouvrier.save
      redirect_to @ouvrier, notice: 'Ouvrier was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ouvriers/1
  def update
    if @ouvrier.update(ouvrier_params)
      redirect_to @ouvrier, notice: 'Ouvrier was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ouvriers/1
  def destroy
    @ouvrier.destroy
    redirect_to ouvriers_url, notice: 'Ouvrier was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ouvrier
      @ouvrier = Ouvrier.find(params[:id])
    end

    # Custom params
    def recherche_params
      params.require(:ouvrier).permit(:domaine_id, :region_id, :departement_id, :metier_id)
    end
    # Only allow a trusted parameter "white list" through.
    def ouvrier_params
      params.require(:ouvrier).permit(:name, :prenom, :telephone, :adresse, :metier_id, :domaine_id, :region_id, :departement_id)
    end
end