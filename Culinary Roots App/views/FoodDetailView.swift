//
//  FoodDetailView.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//

import SwiftUI

struct FoodDetailView: View {
    let food: AfricanFood
    @State private var servings: Int = 0
    

    var scaledIngredients: [Ingredient] {
        food.ingredients.map { ingredient in
            let scaledQuantity = ingredient.quantity * Double(servings) / Double(food.defaultServings)
            return Ingredient(
                name: ingredient.name,
                quantity: scaledQuantity,
                unit: ingredient.unit
            )
        }
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 1.0, green: 0.97, blue: 0.91),
                    Color(red: 0.96, green: 0.85, blue: 0.60)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    
                    AsyncImage(url: URL(string: food.imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 220)
                    .clipped()
                    .cornerRadius(12)

                 
                    VStack(alignment: .leading, spacing: 8) {
                        Text(food.name)
                            .font(.largeTitle)
                            .bold()

                        Text(food.descriptionFood)
                            .font(.body)
                            .foregroundColor(.secondary)
                    }

                  
                    HStack {
                        InfoCard(title: "Time", value: food.preparationTime, icon: "clock")
                        InfoCard(title: "Region", value: food.region, icon: "location")
                    }

                
                    HStack {
                        Text("Servings: \(servings)")
                            .font(.headline)
                            
                        Spacer()
                        Stepper("", value: $servings, in: 1...20)
                    }
                    .padding(.vertical, 4)

                 
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ingredients")
                            .font(.title3)
                            .bold()
                        
                        ForEach(scaledIngredients, id: \.name) { ingredient in
                            HStack {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.green)
                                    .font(.caption)
                                Text("\(ingredient.quantity, specifier: "%.1f") \(ingredient.unit) \(ingredient.name)")
                            }
                        }
                    }

              
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Cooking Instructions")
                            .font(.title3)
                            .bold()

                        ForEach(Array(food.cookingInstructions.enumerated()), id: \.offset) { index, instruction in
                            HStack(alignment: .top) {
                                Text("\(index + 1)")
                                    .font(.caption)
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(width: 24, height: 24)
                                    .background(Color.blue)
                                    .clipShape(Circle())

                                Text(instruction)
                                    .font(.body)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(food.name)
        }
        .onAppear {
            servings = food.defaultServings
           
            
        }
    }
}
#Preview {
    FoodDetailView(food: AfricanFood(
        name: "Sadza",
        description: "Zimbabwe's staple food made from cornmeal",
        ingredients: [
            Ingredient(name: "Cornmeal", quantity: 2, unit: "cups"),
            Ingredient(name: "Water", quantity: 4, unit: "cups"),
            Ingredient(name: "Salt", quantity: 1, unit: "tsp")
        ],
        preparationTime: "30 minutes",
        region: "Southern Africa",
        imageURL: "https://i.pinimg.com/736x/52/18/97/52189721a8b946319c9395cef42ee225.jpg",
        cookingInstructions: [
            "Boil water with a pinch of salt",
            "Gradually add cornmeal while stirring",
            "Cook for 20–25 minutes until thick",
            "Serve hot with vegetables or meat"
        ],
        defaultServings: 2
    ))
    
}
