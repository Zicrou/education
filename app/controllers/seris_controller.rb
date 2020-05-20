class SerisController < ApplicationController
  before_action :set_seri, only: [:show, :edit, :update, :destroy]
  access user: {except: [:index, :show, :new, :edit, :create, :update, :destroy]}, site_admin: :all, censeur: [:new, :index, :create, :edit, :update, :show]
  layout 'general-layout'

  # GET /seris
  def index
    @seris = Seri.all
  end

  # GET /seris/1
  def show
  end

  # GET /seris/new
  def new
    @seri = Seri.new
  end

  # GET /seris/1/edit
  def edit
  end

  # POST /seris
  def create
    @seri = Seri.new(seri_params)

    if @seri.save
      redirect_to @seri, notice: 'Serie was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /seris/1
  def update
    if @seri.update(seri_params)
      redirect_to @seri, notice: 'Serie was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /seris/1
  def destroy
    @seri.destroy
    redirect_to seris_url, notice: 'Serie was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seri
      @seri = Seri.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def seri_params
      params.require(:seri).permit(:name, :niveau_id)
    end
end
