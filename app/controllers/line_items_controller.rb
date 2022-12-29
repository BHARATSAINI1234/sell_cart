class LineItemsController < ApplicationController
	include CurrentCart
	before_action :set_cart, only: [:create]
	before_action :line_item, only: [:edit, :show, :destroy, :update]
	
	def index
		@line_item = LineItem.all
	end

	def show 
	end

	def new
		@line_item = LineItem.new
	end

	def create
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product)
		if @line_item.save
			redirect_to @line_item.cart 
		else
			render 'new' 
		end
	end

	
	def edit
	end

	 def update
      if @line_item.update(line_item_params)
        redirect_to @line_item
        flash[notice] = "Line item was successfully updated."
      else
        render 'edit' 
      end
  end


	def destroy
		@line_item.destroy
      redirect_to line_items_url
      flash[notice] = "Line item was successfully destroyed"
	end

	private 

	def set_line_item
      @line_item = LineItem.find(params[:id])
  end

  def line_item_params	
      params.require(:line_item).permit(:product_id)
  end



end
