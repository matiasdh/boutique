# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  image       :string(255)
#  name        :string(255)
#  description :text
#  price       :float            default(1.0)
#  created_at  :datetime
#  updated_at  :datetime
#  position    :integer
#

class Product < ActiveRecord::Base

	include ActionView::Helpers::NumberHelper
	acts_as_list
	UNITS = [:kg, :unidad]

	has_many :cart_products, inverse_of: :product,
	                         dependent: :nullify


	mount_uploader :image, ImageUploader

	validates :price, presence:   true,
                      numericality: { greater_than_or_equal_to: 0.1 }
	validates :name,  presence:   true
	validates :name,  uniqueness: true
	validates :unit,  presence:   true

	def sanitized_price
		if self.is_kg?
	  		"$ #{number_with_precision(price, precision: 2,strip_insignificant_zeros: true, separator: '.')} x #{unit.to_s.titleize}" 
		else
			"$ #{number_with_precision(price, precision: 2,strip_insignificant_zeros: true, separator: '.')} c/u"
		end
	end

	def unit
		UNITS[self[:unit]]
	end

	def unit=(value)
		self[:unit] = UNITS.index(value.to_sym)
	end



	UNITS.each_with_index do |v, i|
		define_method :"is_#{v}?" do
	      self[:unit] == i
	    end
	end

end
