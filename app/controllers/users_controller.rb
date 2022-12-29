class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

  def new
  	@user = User.new
  end

  def create 
    if !!current_user.nil?
    	@user = User.new(user_params)
    	if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome to the Shopcart App!"
    		redirect_to products_path
    	else 
        flash[:notice] = "Please enter valid details"
    		redirect_to signup_path
    	end
    else
       flash[:notice] = "you are already login"
    end

  end 

  def destroy
    session[:user_id] = nil
  	redirect_to root_url
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  
end
