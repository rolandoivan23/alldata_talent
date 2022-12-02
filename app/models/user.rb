class User < ApplicationRecord
	has_many :user_skills

	validates :ignition_id, presence: true, uniqueness: true
	validates :full_name, presence: true
	validates :department, presence: true
end
