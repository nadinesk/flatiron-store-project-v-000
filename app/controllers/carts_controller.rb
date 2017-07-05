class CartsController < ApplicationController

	def show

		  @cart = Cart.find(params[:id])
		  @user = User.find(@cart.user.id)


		

	end

	def checkout
		@cart = Cart.find(params[:id])
		@user = User.find(@cart.user.id)
		@user.current_cart = nil
		@user.save
		@cart.line_items.each do |line_item|
			line_item.item.inventory -= line_item.quantity
			line_item.item.save
		end

		@cart.status = "submitted"		
		@cart.save		
		redirect_to cart_path(params[:id])


	end

end
