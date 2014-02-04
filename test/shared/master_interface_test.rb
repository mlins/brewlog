module MasterInterfaceTest
  def test_implements_the_master_interface
    assert_respond_to(@object, :master?)
    assert_respond_to(@object.class, :masters)
  end

  def test_implements_dup_properly
    @object.user_id = 1
    @object.master = true

    assert_nil @object.dup.user_id
    refute @object.dup.master
  end
end
