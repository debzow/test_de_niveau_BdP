require 'test_helper'

class MealTypeTest < ActiveSupport::TestCase
  def setup
    @vegan = MealType.new(name:"vegan")
  end

  #sign-up should be OK if all required field OK
  test "should be valid" do
    assert @vegan.save, "not saved with all required field OK"
  end

  #sign-up should be NOT OK if firstname mising
  test "first_name should be present" do
    @vegan.name = ""
    assert_not @vegan.save, "saved meal_type without name"
  end

    #Meal Type NOT OK if meal type already exist
    test "meal_type should be unique" do
      @vegan_duplication = MealType.new(name: @vegan.name)
      @vegan.save
      assert_not @vegan_duplication.save, "saved meal_type with existing"
    end
end
