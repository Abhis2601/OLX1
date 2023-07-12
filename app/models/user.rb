class User < ApplicationRecord
	# require "securerandom"
	has_many :products ,dependent: :destroy
	has_many :purchases ,dependent: :destroy

	# has_secure_password
	validates :first_name,:last_name ,:password,:mobile_no,:email,presence: true
	validates :email,:mobile_no ,uniqueness: true
	validates :mobile_no ,length:{is:10}
	validates :password,length:{minimum:4}

   has_one_attached :profile_picture
end
