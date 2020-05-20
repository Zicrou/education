class MatieresController < ApplicationController
  before_action :set_matiere, only: [:show, :edit, :update, :destroy]
  access user: {except: [:index, :show, :new, :edit, :create, :update, :destroy]}, site_admin: :all, censeur: [:new, :index, :create, :edit, :update, :show]
  layout 'general-layout'
  
  # GET /matieres
  def index
    @matieres = Matiere.all
  end

  # GET /matieres/1
  def show
  end

  # GET /matieres/new
  def new
    @matiere = Matiere.new
  end

  # GET /matieres/1/edit
  def edit
  end

  # POST /matieres
  def create
    @matiere = Matiere.new(matiere_params)

    if @matiere.save
      redirect_to @matiere, notice: 'Matiere was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /matieres/1
  def update
    if @matiere.update(matiere_params)
      redirect_to @matiere, notice: 'Matiere was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /matieres/1
  def destroy
    @matiere.destroy
    redirect_to matieres_url, notice: 'Matiere was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matiere
      @matiere = Matiere.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def matiere_params
      params.require(:matiere).permit(:name, :seri_id)
    end
end
