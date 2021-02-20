class FilieresController < ApplicationController
  before_action :set_filiere, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /filieres
  def index
    @filieres = Filiere.all
  end

  # GET /filieres/1
  def show
  end

  # GET /filieres/new
  def new
    @filiere = Filiere.new
  end

  # GET /filieres/1/edit
  def edit
  end

  # POST /filieres
  def create
    @filiere = Filiere.new(filiere_params)

    if @filiere.save
      redirect_to @filiere, notice: 'Filiere was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /filieres/1
  def update
    if @filiere.update(filiere_params)
      redirect_to @filiere, notice: 'Filiere was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /filieres/1
  def destroy
    @filiere.destroy
    redirect_to filieres_url, notice: 'Filiere was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filiere
      @filiere = Filiere.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def filiere_params
      params.require(:filiere).permit(:name, :niveau_id)
    end
end
