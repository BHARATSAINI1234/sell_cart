module SessionsHelper
	

	def current_user 
		if session[:user_id]
			current_user ||= User.find_by(id: session[:user_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end


  # Logs out the current user.
  def log_out
    forget(current_user)
    reset_session
    @current_user = nil
  end

end
