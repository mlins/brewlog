require 'test_helper'
require 'shared/master_interface_test'

class FermentableTest < ActiveSupport::TestCase
  include MasterInterfaceTest

  def setup
    @fermentable = @object = Fermentable.new
  end
end
