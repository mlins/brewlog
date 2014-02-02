require 'test_helper'

class HopsTest < ActionDispatch::IntegrationTest
  def test_creating_new_hop
    visit new_user_session_path
    assert page.has_content?('BrewLog')
  end
end
