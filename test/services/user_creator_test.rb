require 'test_helper'

class UserCreatorTest < ActiveSupport::TestCase
  def test_create
    user       = User.new
    master_hop = Hop.new
    user_hops  = []
    creator    = UserCreator.new(user, { Hop => :hops })

    Hop.stubs(:masters).returns([master_hop])
    user.stubs(:hops).returns(user_hops)

    user.expects(:save).returns(true)

    creator.create

    assert_equal 1, user_hops.size
  end
end
