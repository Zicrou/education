class LeconsController < ApplicationController
  before_action :set_lecon, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /lecons
  def index
    @lecons = Lecon.all
  end

  # GET /lecons/1
  def show
  end

  # GET /lecons/new
  def new
    @lecon = Lecon.new
  end

  # GET /lecons/1/edit
  def edit
  end

  # POST /lecons
  def create
    @lecon = Lecon.new(lecon_params)

    if @lecon.save
      redirect_to @lecon, notice: 'Lecon was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lecons/1
  def update
    if @lecon.update(lecon_params)
      redirect_to @lecon, notice: 'Lecon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lecons/1
  def destroy
    @lecon.destroy
    redirect_to lecons_url, notice: 'Lecon was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecon
      @lecon = Lecon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lecon_params
      params.require(:lecon).permit(:title, :body)
    end
end
