class ApplicationController < ActionController::Base
	include JsonWebToken
 before_action :authenticate_request 

	# before_action do
  #   ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
  # end	

	private

		def authenticate_request
			begin
				header = request.headers["Authorization"]
				header = header.split(" ").last if header
				decoded = jwt_decode(header)
				@current_user=User.find(decoded[:user_id])
		
			rescue
				render json:{message:"please provide a token"},status: :unauthorized
			end
		end

end
