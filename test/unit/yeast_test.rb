# == Schema Information
#
# Table name: yeasts
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  laboratory      :string(255)
#  description     :string(255)
#  form            :string(255)
#  product_id      :string(255)
#  min_temperature :decimal(, )
#  max_temperature :decimal(, )
#  min_attenuation :decimal(, )
#  max_attenuation :decimal(, )
#  flocculation    :string(255)
#  master          :boolean          default(FALSE)
#  notes           :text
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class YeastTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
