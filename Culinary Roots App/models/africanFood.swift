//
//  africanFood.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//

import Foundation
import SwiftData



@Model
class AfricanFood: Identifiable {
//    var id = UUID()
    var name: String
    var descriptionFood : String
    var preparationTime: String
    var region: String
    var imageURL: String
    var cookingInstructions: [String]
    var defaultServings: Int
    
    @Relationship(deleteRule: .cascade)
    var ingredients: [Ingredient] = []
    
    init(name: String, description: String, ingredients: [Ingredient], preparationTime: String, region: String, imageURL: String, cookingInstructions: [String], defaultServings: Int) {
        self.name = name
        self.descriptionFood = description
        self.ingredients = ingredients
        self.preparationTime = preparationTime
        self.region = region
        self.imageURL = imageURL
        self.cookingInstructions = cookingInstructions
        self.defaultServings = defaultServings
    }
}

@Model
class Ingredient: Identifiable {
//    var id = UUID()
    var name: String
    var quantity: Double
    var unit: String
    
    @Relationship(inverse: \AfricanFood.ingredients)
    var food: AfricanFood?
    
    init(name: String, quantity: Double, unit: String) {
        self.name = name
        self.quantity = quantity
        self.unit = unit
    }
}
