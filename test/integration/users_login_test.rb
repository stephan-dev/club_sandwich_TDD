require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  #test "has link to secret page" do
  #   assert_select true
  #end


  def setup
    @user = users(:david)
  end


  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end

end
