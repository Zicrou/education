class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy, :definir_profil]
  access all: [:index, :definir_profil], user: {except: [:index, :definir_profil, :show, :destroy, :create, :edit, :update, :new, :definir_profil]}, site_admin: :all
layout 'general-layout'
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		
	end

	def create
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	if @user.update(user_params)
  		redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
	end

	def destroy
	end

	def definir_profil
		if @user.set_to_profil('user')
			#pry
			redirect_to users_url, notice: 'Le statut du cours a été modifié avec succés.'
		end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
	def user_params
      params.require(:user).permit(:name, :email, :role)
    end
end
