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
#  humulone      :decimal(, )
#  cohumulone    :decimal(, )
#  adhumulone    :decimal(, )
#  lupulone      :decimal(, )
#  colupulone    :decimal(, )
#  adlupulone    :decimal(, )
#  humulene      :decimal(, )
#  myrcene       :decimal(, )
#  caryophyllene :decimal(, )
#  farnese       :decimal(, )
#  notes         :text
#  user_id       :integer
#  master        :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class HopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
