require 'test_helper'
require 'shared/master_interface_test'

class StyleTest < ActiveSupport::TestCase
  include MasterInterfaceTest

  def setup
    @style = @object = Style.new
  end
end
