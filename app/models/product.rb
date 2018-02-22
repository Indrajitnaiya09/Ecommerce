class Product < ApplicationRecord
	belongs_to :category
	has_many :reviews
	has_many :wish_lists
	has_many :cart_line_items
	has_many :order_line_items
	mount_uploader :cover, CoverUploader
	
	extend FriendlyId
  	friendly_id :name, use: :slugged

	validates_presence_of :name, :price, :description, :stock, :category_id
	validates_numericality_of :stock, greater_than_or_equal_to: 0
	validates_numericality_of :price, greater_than_or_equal_to: 0
	validates_numericality_of :category_id, greater_than_or_equal_to: 0
	validates_length_of :description, minimum: 5
end
