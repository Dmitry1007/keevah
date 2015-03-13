class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      if user.user?
        redirect_to user_path(user) # flash[:notice] = "You are currently logged in as #{user.full_name}."
      elsif user.admin?
        redirect_to '/admin' # flash[:notice] "Logged in."
      end
    else
      flash[:errors] = "Invalid Login"
      redirect_to '/login'
    end
  end

end