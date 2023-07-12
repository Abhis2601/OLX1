class ProductsController < ApplicationController

	def create
		@product=@current_user.products.new(products_params)
		@product.status='available'
		if @product.save
			render json: @product ,status: :created
		else
			render json:{error: @product.errors.full_messages},status: :unprocessable_entity
		end
	end

	def update
		@product = Product.find_by_id(params[:id])
		if @product.present?
			if @product.user_id == @current_user.id
			  if @product.update(products_params)
					render json: @product ,status: :ok
				else
					render json:{error: @product.errors.full_messages},status: :unprocessable_entity
				end
			else
				render json:{message:"You can not update this product ,because it is not your's product"}
			end
		else
			render json:{message:"Please enter right id of Product"}
		end
	end

  def destroy
  	@product = Product.find_by_id(params[:id])
  	if @product.user_id == @current_user.id
  		 @product.destroy
  		 render json:{message:'Delete Sucessfully'},status: :ok
		else
			render json:{message:'You can not delete this product,because it is not your product'},status: :ok
		end
  end

	def available_product
		@product=Product.where(status:"available")
		check_render(@product ,"No Products Are available")
	end
  
  def sold_product
  	@product=Product.where(status:'sold',user_id:@current_user.id)
  	check_render(@product ,"No product sold")
  end

	def particular_product
		@product=Product.where(name:params[:name],status:'available')
		check_render(@product, "Please Write valid name")
	end

	def users_product
		@product=Product.where(user_id:@current_user.id, status:'available')
		check_render(@product ,"No Products of this user")
	end  

	def search_product_category
		# byebug
		@product=Product.where(category_id:params[:category_id], status:"available")
		check_render(@product ,"Please give write id of category")
	end

	def search_alphanumeric
		@product=Product.where(alphanumeric_id:params[:alphanumeric_id], status:'available')
		check_render(@product,"Please give valid alphanumeric id")
	end 

private
	def products_params
		params.permit(:name, :category_id, :alphanumeric_id, :price, :description, :image)
	end

	def check_render( value, message )
		if value.present?
			render json: value , status: :ok
		else
			render json: { message: "#{message}" }
		end
	end 
end

