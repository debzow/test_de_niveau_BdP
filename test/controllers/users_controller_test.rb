require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @michael = User.create(first_name: "Michael",last_name: "Gerard",email: "michael@test.fr", password: 'topsecret', password_confirmation: 'topsecret')
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit_meal_restriction" do
    get users_edit_meal_restriction_url
    assert_response :success
  end

  test "should get update_meal_restriction" do
    get users_update_meal_restriction_url
    assert_response :success
  end

  test "sign in with valid information" do
    #sign in
    get user_session_path
    post user_session_path, params:{user:{email:@michael.email, password:"topsecret", remember_me:"0"}}
    #check if sign in OK by cheking if profile link is displayed
    follow_redirect!
    assert_select "a", {:count=>1, :text=> "Profile"}
  end

  test "no sign in with valid wrong information" do
    #sign in
    get user_session_path
    post user_session_path, params:{user:{email:"wrong@test.fr", password:"topsecret", remember_me:"0"}}
    #check if sign in OK by cheking if profile link is displayed
    assert_select "a", {:count=>1, :text=> "Se connecter"}
  end


end
