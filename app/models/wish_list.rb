class WishList < ApplicationRecord
	validates_presence_of :user_id, :product_id
	belongs_to :user
	belongs_to :product
end
