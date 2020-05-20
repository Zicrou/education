class NiveausController < ApplicationController
  before_action :set_niveau, only: [:show, :edit, :update, :destroy]
  access user: {except: [:index, :show, :new, :edit, :create, :update, :destroy]}, site_admin: :all, censeur: [:new, :index, :create, :edit, :update, :show]
  layout 'general-layout'
  
  # GET /niveaus
  def index
    @niveaus = Niveau.all
  end

  # GET /niveaus/1
  def show
  end

  # GET /niveaus/new
  def new
    @niveau = Niveau.new
  end

  # GET /niveaus/1/edit
  def edit
  end

  # POST /niveaus
  def create
    @niveau = Niveau.new(niveau_params)

    if @niveau.save
      redirect_to @niveau, notice: 'Niveau was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /niveaus/1
  def update
    if @niveau.update(niveau_params)
      redirect_to @niveau, notice: 'Niveau was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /niveaus/1
  def destroy
    @niveau.destroy
    redirect_to niveaus_url, notice: 'Niveau was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_niveau
      @niveau = Niveau.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def niveau_params
      params.require(:niveau).permit(:name, :abbrege)
    end
end
