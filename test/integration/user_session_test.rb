require 'test_helper'

class UserSessionTest < ActionDispatch::IntegrationTest
  def test_sign_up
    sign_up_user

    assert page.has_content?('Your account was successfully confirmed.')
  end

  def test_sign_in
    sign_up_user
    sign_in_user

    assert page.has_content?('Signed in successfully.')
    assert_equal root_path, current_path
  end

  def test_sign_out
    sign_up_user
    sign_in_user

    click_on 'Sign out'

    assert_equal new_user_session_path, current_path
  end
end
