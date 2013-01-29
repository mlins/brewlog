# == Schema Information
#
# Table name: hops
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  origin        :string(255)
#  alpha         :decimal(, )
#  beta          :decimal(, )
#  description   :string(255)
#  form          :string(255)
#  hsi           :decimal(, )
#  humulene      :decimal(, )
#  caryophyllene :decimal(, )
#  cohumulone    :decimal(, )
#  myrcene       :integer
#  notes         :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class HopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
