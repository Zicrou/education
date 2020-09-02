class JurisController < ApplicationController
  before_action :set_juri, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all
  layout 'general-layout'

  # GET /juris
  def index
    @juris = Juri.all
  end

  # GET /juris/1
  def show
  end

  # GET /juris/new
  def new
    @juri = Juri.new
  end

  # GET /juris/1/edit
  def edit
  end

  # POST /juris
  def create
    @juri = Juri.new(juri_params)

    if @juri.save
      redirect_to @juri, notice: 'Juri was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /juris/1
  def update
    if @juri.update(juri_params)
      redirect_to @juri, notice: 'Juri was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /juris/1
  def destroy
    @juri.destroy
    redirect_to juris_url, notice: 'Juri was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_juri
      @juri = Juri.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def juri_params
      params.require(:juri).permit(:numjuri, :centre_id)
    end
end
