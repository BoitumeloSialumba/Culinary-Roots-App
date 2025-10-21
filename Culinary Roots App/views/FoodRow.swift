//
//  FoodRow.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
import SwiftUI

struct FoodRowView: View {
    let food: AfricanFood
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: food.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 80, height: 80)
            .clipped()
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(food.name)
                    .font(.title2)
                    .foregroundColor(.primary)
                
                Text(food.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
        }
        .padding(.vertical, 8)
        
        .cornerRadius(8)
    }
}
#Preview {
    FoodRowView(food:AfricanFood(
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
        defaultServings: 4
        ))
}
