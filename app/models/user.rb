# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)      not null
#  last_name              :string(255)      not null
#  telephone              :string(255)      not null
#  address                :string(255)      not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many   :cart_products,  dependent: :destroy,
                              inverse_of: :owner,
                              as: :owner
  has_many   :purchases,      inverse_of: :user

  validates_associated :cart_products

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :email,      presence: true
  validates :address,    presence: true
  validates :telephone,  presence: true


  accepts_nested_attributes_for :cart_products,
                                allow_destroy: true

  def full_name
    "#{first_name.titleize} #{last_name.titleize}"
  end

  def cart_subtotal
    cart_products.pluck(:quantity,:price)
                 .map{ |v, w| v * w }
                 .sum
  end

  def purchase_products
  	purchase = self.purchases.new
    purchase.cart_products << self.cart_products
    purchase.save
    puts purchase.errors.to_json
    purchase
  end

end
