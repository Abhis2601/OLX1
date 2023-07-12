class UsersController < ApplicationController
  skip_before_action :authenticate_request ,only:[:create_user]
	
	def create_user
		@user=User.new(params_user)
		if @user.save
			render json: @user ,status: :created
		else
			render json:{error: @user.errors.full_messages},status: :unprocessable_entity
		end
	end

	def index
		@user=User.all
		render json: @user
	end

	def update_user
		@user=User.find_by(id: @current_user)
		if @user.update(params_user)
 			render json: @user ,status: :created
 		else
 		  render json:{error: @user.errors.full_messages},status: :unprocessable_entity
		end
	end

	private

	def params_user
		params.permit(:first_name,:last_name,:mobile_no,:email,:password,:profile_picture)
	end
	
end
