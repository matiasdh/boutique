# == Schema Information
#
# Table name: slider_images
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#

class SliderImage < ActiveRecord::Base
end
