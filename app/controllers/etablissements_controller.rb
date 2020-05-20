class EtablissementsController < ApplicationController
  before_action :set_etablissement, only: [:show, :edit, :update, :destroy]
  access user: {except: [:index, :show, :new, :edit, :create, :update, :destroy]}, site_admin: :all, censeur: [:new, :edit, :create, :update,]
  layout 'general-layout'

  # GET /etablissements
  def index
    @etablissements = Etablissement.all
  end

  # GET /etablissements/1
  def show
  end

  # GET /etablissements/new
  def new
    @etablissement = Etablissement.new
  end

  # GET /etablissements/1/edit
  def edit
  end

  # POST /etablissements
  def create
    @etablissement = Etablissement.new(etablissement_params)

    if @etablissement.save
      redirect_to @etablissement, notice: 'Etablissement was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /etablissements/1
  def update
    if @etablissement.update(etablissement_params)
      redirect_to @etablissement, notice: 'Etablissement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /etablissements/1
  def destroy
    @etablissement.destroy
    redirect_to etablissements_url, notice: 'Etablissement was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etablissement
      @etablissement = Etablissement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def etablissement_params
      params.require(:etablissement).permit(:name, :adresse, :departement_id)
    end
end
