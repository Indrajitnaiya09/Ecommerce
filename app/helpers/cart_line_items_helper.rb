module CartLineItemsHelper
	def total_item_calculation
		return "Cart(#{current_user.cart_line_items.pluck(:quantity).inject(:+)})"
	end
end
