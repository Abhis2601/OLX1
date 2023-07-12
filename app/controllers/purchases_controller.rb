class PurchasesController < ApplicationController
	
	def buy_product
				byebug
		if params[:id].present? 
			@product = Product.find_by(id:params[:id])
			if @product.present?
				if @product.user_id == @current_user.id
					render json:{message:"this is your product ,you can not buy"}
				else
					@product.update(status:"sold")
			
					@purchase=@current_user.purchases.new(product_id:@product.id)
					if @purchase.save
						render json:@purchase ,status: :created
					else
						render json:{error:@purchase.errors.full_messages},status: :unprocessable_entity
					end
				end
			else
				render json:{message:"Please give valid Id"}
			end
		else
			render json:{message:"Id can't be blank"}
		end
	end

	def index
		@purchase=Purchase.all
		check_data
	end

	def purchasing_current_user
		@purchase=Purchase.where(user_id:@current_user.id)
		 check_data
	end


	def search_product
		@purchase=Purchase.where(product_id:params[:id],user_id:@current_user.id)
		check_data
	end

	private

	def check_data
		if @purchase.present?
			render json:@purchase ,status: :ok
		else
			render json:{message:"No purchase"}
		end
	end
	
end
