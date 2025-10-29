//
//  FoodListView.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//
import SwiftUI

struct FoodListView: View {
    let foods: [AfricanFood]

    var body: some View {
            List(foods) { food in
                NavigationLink(destination: FoodDetailView(food: food)) {
                    FoodRowView(food: food)
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
        }
    }

#Preview {
    FoodListView(foods: [
        AfricanFood(
            name: "Sadza",
            description: "Zimbabwe's staple food made from cornmeal, similar to polenta",
            ingredients: [
                Ingredient(name: "Cornmeal (mealie meal)", quantity: 2, unit: "cups"),
                Ingredient(name: "Water", quantity: 4, unit: "cups"),
                Ingredient(name: "Salt", quantity: 1, unit: "tsp")
            ],
            preparationTime: "30 minutes",
            region: "Southern Africa",
            imageURL: "https://i.pinimg.com/736x/52/18/97/52189721a8b946319c9395cef42ee225.jpg",
            cookingInstructions: [
                "Boil water with a pinch of salt",
                "Gradually add cornmeal while stirring",
                "Cook for 20–25 minutes, stirring constantly",
                "Serve hot with vegetables or meat"
            ],
            defaultServings: 2
            ),
        
        AfricanFood(
            name: "Bobotie",
            description: "South African baked dish consisting of spiced minced meat with an egg-based topping",
            ingredients: [
                Ingredient(name: "Minced beef", quantity: 500, unit: "g"),
                Ingredient(name: "Bread", quantity: 2, unit: "slices"),
                Ingredient(name: "Milk", quantity: 1, unit: "cup"),
                Ingredient(name: "Onion", quantity: 1, unit: "large"),
                Ingredient(name: "Spices", quantity: 1, unit: "tbsp"),
                Ingredient(name: "Eggs", quantity: 2, unit: "pieces"),
                Ingredient(name: "Raisins", quantity: 1, unit: "handful")
            ],
            preparationTime: "1 hour",
            region: "Southern Africa",
            imageURL: "https://tasteoftheplace.com/wp-content/uploads/2017/05/Bobotie-at-TasteOfThePlace.com-IG.jpg",
            cookingInstructions: [
                "Soak bread in milk",
                "Fry onions and mince",
                "Mix meat with soaked bread, spices, and raisins",
                "Bake with egg topping for 30 minutes"
            ],
            defaultServings: 2
        )
    ])
}
