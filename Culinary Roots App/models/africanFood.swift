//
//  africanFood.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//

import Foundation

struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    let quantity: Double
    let unit: String
}

struct AfricanFood: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let ingredients: [Ingredient]
    let preparationTime: String
    let region: String
    let imageURL: String
    let cookingInstructions: [String]
   let defaultServings: Int
}
