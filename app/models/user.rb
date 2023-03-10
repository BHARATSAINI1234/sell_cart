class User < ApplicationRecord
	has_many :products
  	has_many :carts
  
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: {maximum: 20}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {minimum: 6, maximum: 100},
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
 

 
end
