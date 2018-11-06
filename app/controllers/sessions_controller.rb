class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      redirect_to user
    else
      # Create an error message
      flash.now[:danger] = 'Tu n\'es pas un utilisateur enregistré'

      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
