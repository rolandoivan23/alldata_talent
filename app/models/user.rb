class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :rememberable, :authentication_keys => [:ignition_id]#, :validatable, :recoverable
	has_many :user_skills

	validates :ignition_id, uniqueness: true, presence: true
	validates :full_name, presence: true
	validates :department, presence: true
	validates :email, uniqueness: true, presence: true
end
