class DomainesController < ApplicationController
  before_action :set_domaine, only: [:show, :edit, :update, :destroy]
  access [:user, :respons_zone, :professeur, :principale, :censeur, :proviseur] => {except: [:index, :destroy, :create, :edit, :update, :new, :show]}, site_admin: :all, trusted: [:index, :create, :edit, :update, :new, :show, {except: [:destroy]}]

  layout 'general-layout'

  # GET /domaines
  def index
    @domaines = Domaine.all
  end

  # GET /domaines/1
  def show
  end

  # GET /domaines/new
  def new
    @domaine = Domaine.new
  end

  # GET /domaines/1/edit
  def edit
  end

  # POST /domaines
  def create
    @domaine = Domaine.new(domaine_params)

    if @domaine.save
      redirect_to @domaine, notice: 'Domaine was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /domaines/1
  def update
    if @domaine.update(domaine_params)
      redirect_to @domaine, notice: 'Domaine was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /domaines/1
  def destroy
    @domaine.destroy
    redirect_to domaines_url, notice: 'Domaine was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_domaine
      @domaine = Domaine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def domaine_params
      params.require(:domaine).permit(:name)
    end
end
