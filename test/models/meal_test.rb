require 'test_helper'

class MealTest < ActiveSupport::TestCase
  def setup
    @salade = Meal.new(name:"Salade compelte", description:"salade, quinoa, avoat, parmesan", meal_type: MealType.first)
  end

  #sign-up should be OK if all required field OK
  test "should be valid" do
    assert @salade.save, "not saved with all required field OK"
  end

  #sign-up should be NOT OK if firstname mising
  test "name should be present" do
    @salade.name = ""
    assert_not @salade.save, "saved meal without name"
  end

    #Meal NOT OK if meal already exist
    test "meal should be unique" do
      @salade_duplication = Meal.new(name: @salade.name, description:"toto", meal_type: MealType.first)
      @salade.save
      assert_not @salade_duplication.save, "saved meal with existing name"
    end
end
