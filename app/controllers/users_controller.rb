class UsersController < ApplicationController

  def show
	  @user = params[:id].nil? ? current_user : User.find(params[:id])
	  @categories = Category.all
	  render 'users/show'
	end

	def update
	end

end