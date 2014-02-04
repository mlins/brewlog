require 'test_helper'
require 'shared/master_interface_test'

class HopTest < ActiveSupport::TestCase
  include MasterInterfaceTest

  def setup
    @hop = @object = Hop.new
  end
end
