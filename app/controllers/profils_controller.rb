class ProfilsController < ApplicationController
  before_action :set_profil, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
layout 'general-layout'
  # GET /profils
  def index
    @profils = Profil.all
  end

  # GET /profils/1
  def show
  end

  # GET /profils/new
  def new
    @profil = Profil.new
  end

  # GET /profils/1/edit
  def edit
  end

  # POST /profils
  def create
    @profil = Profil.new(profil_params)

    if @profil.save
      redirect_to @profil, notice: 'Profil was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /profils/1
  def update
    if @profil.update(profil_params)
      redirect_to @profil, notice: 'Profil was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /profils/1
  def destroy
    @profil.destroy
    redirect_to profils_url, notice: 'Profil was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profil
      @profil = Profil.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profil_params
      params.require(:profil).permit(:name)
    end
end
