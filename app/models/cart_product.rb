# == Schema Information
#
# Table name: cart_products
#
#  id         :integer          not null, primary key
#  owner_id   :integer
#  owner_type :string(255)
#  product_id :integer
#  price      :float
#  quantity   :integer          default(1)
#  created_at :datetime
#  updated_at :datetime
#

class CartProduct < ActiveRecord::Base
  belongs_to :owner,   polymorphic: true,
                       inverse_of: :cart_products
  belongs_to :product, inverse_of: :cart_products

  validates :owner,      presence: true
  validates :product,    presence: true
  validates :quantity,   presence: true,
                         numericality: { only_integer: true,
                                         greater_than: 0 }

  validates :price,      presence: true

  validates :product_id, uniqueness: { scope: [:owner_id, :owner_type] }


  before_validation :ensure_price_is_present

  def total_price
  	price*quantity
  end

  def product_name
    self.product.name if product.present?
  end

  private

    def ensure_price_is_present
    	self.price ||= product.price if product.present?
    end

end
