# == Schema Information
#
# Table name: purchases
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  total_price :float
#  address     :string(255)
#  confirmed   :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Purchase < ActiveRecord::Base
  belongs_to :user,           inverse_of: :purchases
  has_many   :cart_products,  dependent: :destroy,
                              inverse_of: :owner,
                              as: :owner
  has_many   :products,       through: :cart_products

  validates :user,          presence: true
  validates :total_price,   presence: true
  validates :address,       presence: true
  validates :cart_products, presence: true

  before_validation :ensure_price_is_present

  after_initialize :set_address

  private

  def ensure_price_is_present
    _total_price = 0
    # I've tried to use reduce or inject methods but them don't work with activerecord
    self.cart_products.each do |v|
      _total_price += v.total_price
    end
    self.total_price = _total_price
  end

  def set_address
    self.address ||= user.address if user.present?
  end

end
