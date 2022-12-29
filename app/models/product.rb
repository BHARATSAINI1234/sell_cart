class Product < ApplicationRecord
	has_many :line_items


	has_one_attached :image, dependent: :destroy
	validates :title, presence: true
	validates :description, presence: true, length: { minimum: 6, maxinun: 200}
	validates :price, presence: true 

	belongs_to :user
	
 
end