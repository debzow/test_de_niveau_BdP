require 'test_helper'

class MealsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @michael = User.create(first_name: "Michael",last_name: "Gerard",email: "michael@test.fr", password: 'topsecret', password_confirmation: 'topsecret')
    @meal_type = MealType.create(name: "vegan")
    @meal = Meal.create(name: "Tarte", description: "Delicieux plat", image_url: "", meal_type_id:  @meal_type.id)
  end

  test "access meals#shwo while sign-in" do
    #sign-in
    get user_session_path
    post user_session_path, params:{user:{email:@michael.email, password:"topsecret", remember_me:"0"}}
    #access meals#shwo
    get meals_show_path(id: @meal.id)
    assert_response(:success)
  end

  test "no access meals#shwo while not sign-in" do
    get meals_show_path(id: @meal.id)
    assert_redirected_to(root_path)
    follow_redirect!
    #flash message
    assert flash[:alert]
  end
end
