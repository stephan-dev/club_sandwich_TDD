class UsersController < ApplicationController
	def new
		@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def create
  	user = params[:user]

    @user = User.new(first_name: user[:first_name], last_name: user[:last_name], email: user[:email])
    if @user.save
      flash[:success] = "Bienvenue au club sandwich!"
      redirect_to @user
    else
      render 'new'
    end


  end
end
