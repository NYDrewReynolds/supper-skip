class Item < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :description, presence: true
	validates :price, numericality: { greater_than: 0 }
	validates :categories, presence: true
  has_many :line_items
  has_many :orders, through: :line_items

	has_many :item_categories
	has_many :categories, through: :item_categories

end
