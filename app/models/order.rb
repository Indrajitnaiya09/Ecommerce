class Order < ApplicationRecord

	has_many :order_line_items
	belongs_to :address
	belongs_to :user

	before_validation :set_total_date_number
	after_create :move_to_order_line_items
	after_create :empty_cart_line_items
	after_create :update_stocks

	validates_presence_of :order_number, :order_date, :user_id, :total, :address_id

	def set_total_date_number
		self.order_number = "DCT#{Random.rand(1000)}"
		self.order_date = Date.today
		self.total = calculate_total
	end

	def calculate_total
		total = 0
		self.user.cart_line_items.each do |item|
			total += (item.quantity * item.product.price)
		end
		return total
	end

	def move_to_order_line_items
		self.user.cart_line_items.each do |item|
			OrderLineItem.create(product_id: item.product_id, quantity: item.quantity, price: item.product.price, order_id: self.id)
		end
	end

	def empty_cart_line_items
		CartLineItem.delete(self.user.cart_line_items.pluck(:id))
	end

	def update_stocks
		self.order_line_items.each do |order|
			order.product.update_attributes(stock: order.product.stock - order.quantity)
		end
	end
end
