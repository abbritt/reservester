class Restaurant < ApplicationRecord
	has_many :reservations
	belongs_to :b_user
end
