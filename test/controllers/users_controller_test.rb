require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @michael = users(:michael)
  end

  test "sign in with valid information" do
    #sign in
    get user_session_path
    post user_session_path, params:{user:{email:@michael.email, password:"topsecret", remember_me:"0"}}
    #check if sign in OK by cheking if redirected to root
    assert_redirected_to(root_path)
  end

  test "no sign in with valid wrong information" do
    #sign in
    get user_session_path
    post user_session_path, params:{user:{email:"wrong@test.fr", password:"topsecret", remember_me:"0"}}
    #check if sign in OK by cheking if profile link is displayed
    assert_select "a", {:count=>1, :text=> "Se connecter"}
  end


end
