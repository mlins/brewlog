require 'test_helper'
require 'shared/master_interface_test'

class YeastTest < ActiveSupport::TestCase
  include MasterInterfaceTest

  def setup
    @yeast = @object = Yeast.new
  end
end
