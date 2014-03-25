class HomeController < ApplicationController

	def start
		@highlights = Product.where(highlight: true)
		@offers = Product.where(offer: true).limit(3)
	end

	def about_us
	end

	def recipes
	end
end
