class CentresController < ApplicationController
  before_action :set_centre, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'general-layout'

  # GET /centres
  def index
    @centres = Centre.all
  end

  # GET /centres/1
  def show
  end

  # GET /centres/new
  def new
    @centre = Centre.new
  end

  # GET /centres/1/edit
  def edit
  end

  # POST /centres
  def create
    @centre = Centre.new(centre_params)

    if @centre.save
      redirect_to @centre, notice: 'Centre was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /centres/1
  def update
    if @centre.update(centre_params)
      redirect_to @centre, notice: 'Centre was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /centres/1
  def destroy
    @centre.destroy
    redirect_to centres_url, notice: 'Centre was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_centre
      @centre = Centre.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def centre_params
      params.require(:centre).permit(:numcentre, :departement_id)
    end
end
