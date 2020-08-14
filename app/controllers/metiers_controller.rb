class MetiersController < ApplicationController
  before_action :set_metier, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'general-layout'

  # GET /metiers
  def index
    @metiers = Metier.all
  end

  # GET /metiers/1
  def show
  end

  # GET /metiers/new
  def new
    @metier = Metier.new
  end

  # GET /metiers/1/edit
  def edit
  end

  # POST /metiers
  def create
    @metier = Metier.new(metier_params)

    if @metier.save
      redirect_to @metier, notice: 'Metier was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /metiers/1
  def update
    if @metier.update(metier_params)
      redirect_to @metier, notice: 'Metier was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /metiers/1
  def destroy
    @metier.destroy
    redirect_to metiers_url, notice: 'Metier was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metier
      @metier = Metier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def metier_params
      params.require(:metier).permit(:name)
    end
end
