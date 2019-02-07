require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @david = User.new(first_name: "David",last_name: "Gerard",email: "david@test.fr", password: 'topsecret', password_confirmation: 'topsecret')
    @michael = User.new(first_name: "Michael",last_name: "Gerard",email: "michael@test.fr", password: 'topsecret', password_confirmation: 'topsecret')
  end

  #sign-up should be OK if all required field OK
  test "should be valid" do
    assert @david.save, "not saved with all required field OK"
  end

  #sign-up should be NOT OK if firstname mising
  test "first_name should be present" do
    @david.first_name = ""
    assert_not @david.save, "saved user without first_name"
  end

  #sign-up should be NOT OK if lastname mising
  test "last_name should be present" do
    @david.last_name = ""
    assert_not @david.save, "saved user without last_name"
  end

  #sign-up should be NOT OK if email not certified
  test "email should be certified" do
    @david.email = "toto"
    assert_not @david.save, "saved user without certified email"
  end

  #sign-up should be NOT OK if email already exist
  test "email should be unique" do
    @david.save
    @michael.email = @david.email
    assert_not @michael.save, "saved user with existing email"
  end
end
