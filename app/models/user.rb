class User < ApplicationRecord

	validates_presence_of :name, :phone_no
	has_many :auctions
end
