class ApplicationController < ActionController::Base
  include SessionsHelper

  def current_cart
  	current_user.carts.last
  end
end
