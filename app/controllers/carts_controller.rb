class CartsController < ApplicationController
	before_action :set_cart, only: [:show, :edit, :update, :destroy]

	def index
		@carts = Cart.all
	end

	def new
		@cart = Cart.new
	end

	def create
		@cart = Cart.new(cart_params)
	      if @cart.save
	        redirect_to @cart
	        flash[notice] = "Cart was successfully created" 
	      else
	        render 'new' 
	      end
	end


	def show
		
	end

	def edit
	end

	def update
	      if @cart.update(cart_params)
	        redirect_to @cart
	        flash[notice] = "Cart was successfully updated"
	      else
	        render 'edit' 
	      end
	end

	def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
      redirect_to products_url
      flash[notice] = "Your cart is currently empty" 
  end

	private 

	def set_cart
      @cart = Cart.find(params[:id])
    end

	def cart_params
      params.fetch(:cart, {})
    end
    
end
