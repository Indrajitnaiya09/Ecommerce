class CartLineItem < ApplicationRecord
	validates_presence_of :product_id, :user_id, :quantity

	belongs_to :user
	belongs_to :product

	def save_or_update(data)
		line_item = CartLineItem.find_by(user_id: data[:user], product_id: data[:product])
		if line_item.nil?
			self.save
		else
			line_item.update_attributes(quantity: line_item.quantity + self.quantity)
		end
	end
end
