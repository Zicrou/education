class DepartementsController < ApplicationController
  before_action :set_departement, only: [:show, :edit, :update, :destroy]
  access [:user, :professeur, :principale, :censeur, :proviseur] => {except: [:index, :destroy, :create, :edit, :update, :new, :show]}, site_admin: :all, trusted: [:index, :create, :edit, :update, :new, :show, {except: [:destroy]}], respons_zone: [:new, :create, :edit, :update, :show, {except: [:destroy]}]
  layout 'general-layout'
  # GET /departements
  def index
    @departements = Departement.all
  end

  # GET /departements/1
  def show
  end

  # GET /departements/new
  def new
    @departement = Departement.new
  end

  # GET /departements/1/edit
  def edit
  end

  # POST /departements
  def create
    @departement = Departement.new(departement_params)
    @departement.user_id = current_user.id

    if @departement.save
      redirect_to @departement, notice: 'Departement was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /departements/1
  def update
    @departement.user_id = current_user.id
    if @departement.update(departement_params)
      redirect_to @departement, notice: 'Departement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /departements/1
  def destroy
    @departement.destroy
    redirect_to departements_url, notice: 'Departement was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departement
      @departement = Departement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def departement_params
      params.require(:departement).permit(:name, :region_id)
    end
end
