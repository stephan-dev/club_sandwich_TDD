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
    	log_in @user
      flash[:success] = "Bienvenue au club sandwich!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
  	@user = User.all
  end

end
