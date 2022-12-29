class ProductsController < ApplicationController 
	before_action :user_login
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	
	def index
		if params[:user_id]
			@products = current_user.products
		else
			@products = Product.all
		end
	end

	def new
		@product = Product.new
	end

	def create
	    @product = current_user.products.build(product_params)
		
		if @product.save
			@product.image.attach(params[:product][:image])
			flash[:success] = "product is created!"
			redirect_to products_path
		else 
			render 'new'
		end
	end

	def show
	end
	
	def destroy
	    @product.destroy
	    flash[:success] = "your product is deleted"
		redirect_to products_path    
	end

	
	def edit
	end

	def update
		if @product.update(product_params)
			@product.save	
			flash[:success] = "product is update"
			redirect_to products_path
		else
			render  'edit'
		end
	end
 
	private

	def product_params
		params.require(:product).permit(:title, :description, :image, :price)
	end

	def set_product
		@product = Product.find(params[:id])
	end

	def user_login
		if !current_user
			flash[:alert] = "You are not login, please login"
			redirect_to login_path
		end
	end
end
