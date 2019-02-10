# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Reset database
Meal.destroy_all
MealType.destroy_all

# Create 3 meal types
meal_type_1 = MealType.create(name: "Produits laitier")
meal_type_2 = MealType.create(name: "Salade")
meal_type_3 =  MealType.create(name: "Viande")

# Create 10 meals
Meal.create(name: "TARTE AUX MYRTILLES", description: "Delicieuse tarte au fruit", image_url: "https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/521f0f861fc0a.png", meal_type_id: meal_type_1.id)
Meal.create(name: "TARTE AUX MIRABELLES", description: "Delicieuse tarte au fruit", image_url: "https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/57236ef855a29.jpeg", meal_type_id: meal_type_1.id)
Meal.create(name: "TARTE TATIN", description: "Delicieuse tarte au fruit", image_url: "https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/550c5863bf32e.jpeg", meal_type_id: meal_type_1.id)
Meal.create(name: "POULET TANDOORI", description: "Poulet aux epices indiennes", image_url: "https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/5329c8bd9268c.jpeg", meal_type_id: meal_type_3.id)
Meal.create(name: "BOEUF WELLINGTON", description: "Delicieux plat de boeuf", image_url: "https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/526e4543dcb7e.jpeg", meal_type_id: meal_type_3.id)
Meal.create(name: "FILETS DE POULET PANÉS", description: "Poulet à la chapelure" , image_url: "https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/556c3a2e8052f.jpeg", meal_type_id: meal_type_3.id)
Meal.create(name: "LASAGNES AU BOEUF", description: "Delicieux plat italien" , image_url: "https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/521f1346c2d6e.jpeg", meal_type_id: meal_type_3.id)
Meal.create(name: "SALADE LYONNAISE", description: "Plat frais et lege", image_url: "https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/57a34fcc00647.jpeg", meal_type_id: meal_type_2.id)
Meal.create(name: "RIZ CANTONNAIS FACILE", description: "Plat frais et facile à cusiner" , image_url: "https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/521f132a9e765.jpeg", meal_type_id: meal_type_2.id)
Meal.create(name: "SALADE PRINTANIÈRE", description: "Melange de delicieux ingredients" , image_url: "https://kiwings-images-prod.s3-eu-west-1.amazonaws.com/recipes/555a191116cea.jpeg", meal_type_id: meal_type_2.id)
