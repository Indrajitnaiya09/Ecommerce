class Role < ApplicationRecord
	has_many :premissions
	has_many :users, through: :premissions
	validates_presence_of :name
	validates_uniqueness_of :name
end
