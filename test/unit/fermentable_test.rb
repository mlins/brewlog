# == Schema Information
#
# Table name: fermentables
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  origin                 :string(255)
#  supplier               :string(255)
#  description            :string(255)
#  max_in_batch           :decimal(, )
#  potential              :decimal(, )
#  yield                  :decimal(, )
#  coarse_fine_difference :decimal(, )
#  moisture               :decimal(, )
#  diastatic_power        :decimal(, )
#  protein                :decimal(, )
#  ibu                    :decimal(, )
#  color                  :decimal(, )
#  recommended_mash       :boolean          default(FALSE)
#  add_after_boil         :boolean          default(FALSE)
#  notes                  :text
#  master                 :boolean          default(FALSE)
#  user_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class FermentableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
