class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
  		session[:user_id] = user.id 
      flash[:success] = "Welcome to the Shopcart App!"
      redirect_to products_path
  	else
  		flash[:notice] = "Invalid email/password combination"
	  	redirect_to login_path
 	  end 
  end

  def destroy
  	session[:user_id] = nil 
  	redirect_to root_url
  end

end
