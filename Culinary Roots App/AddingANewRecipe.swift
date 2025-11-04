//
//  AddingANewRecipe.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//


//import SwiftUI
//import SwiftData
//
//struct AddingANewRecipe: View {
//    @Environment(\.modelContext) private var context
//    @Environment(\.dismiss) private var dismiss
//    @ObservedObject var service: AfricanFoodService
//
//    @State private var name = ""
//    @State private var descriptionFood = ""
//    @State private var region = ""
//    @State private var preparationTime = ""
//    @State private var imageURL = ""
//    @State private var defaultServings = 2
//
//    @State private var ingredients: [Ingredient] = []
//    @State private var ingredientName = ""
//    @State private var ingredientQuantity = ""
//    @State private var ingredientUnit = ""
//
//    @State private var cookingInstructions: [String] = []
//    @State private var instructionText = ""
//
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 16) {
//
//                Group {
//                    TextField("Recipe Name", text: $name)
//                        .textFieldStyle(.roundedBorder)
//                        .frame(width: 350)
//                    TextField("Description", text: $descriptionFood)
//                        .textFieldStyle(.roundedBorder)
//                        .frame(width: 350)
//                    TextField("Region", text: $region)
//                        .textFieldStyle(.roundedBorder)
//                        .frame(width: 350)
//                    TextField("Preparation Time", text: $preparationTime)
//                        .textFieldStyle(.roundedBorder)
//                        .frame(width: 350)
//                    TextField("Image URL", text: $imageURL)
//                        .textFieldStyle(.roundedBorder)
//                        .frame(width: 350)
//                    Stepper("Servings: \(defaultServings)", value: $defaultServings, in: 1...20)
//                
//                }
//                Divider()
//
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("Ingredients").font(.headline)
//                    HStack {
//                        TextField("Name", text: $ingredientName)
//                            .textFieldStyle(.roundedBorder)
//                        TextField("Qty", text: $ingredientQuantity)
//                            .textFieldStyle(.roundedBorder)
//                            .frame(width: 60)
//                        TextField("Unit", text: $ingredientUnit)
//                            .textFieldStyle(.roundedBorder)
//                            .frame(width: 80)
//                        Button("Add") {
//                            guard let qty = Double(ingredientQuantity) else { return }
//                            let newIngredient = Ingredient(name: ingredientName, quantity: qty, unit: ingredientUnit)
//                            ingredients.append(newIngredient)
//                            ingredientName = ""
//                            ingredientQuantity = ""
//                            ingredientUnit = ""
//                        }
//                    }
//
//                    ForEach(ingredients.indices, id: \.self) { i in
//                        Text("• \(ingredients[i].quantity) \(ingredients[i].unit) \(ingredients[i].name)")
//                    }
//                }
//
//                Divider()
//
//               
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("Cooking Instructions").font(.headline)
//                    HStack {
//                        TextField("Instruction", text: $instructionText)
//                            .textFieldStyle(.roundedBorder)
//                        Button("Add") {
//                            if !instructionText.isEmpty {
//                                cookingInstructions.append(instructionText)
//                                instructionText = ""
//                            }
//                        }
//                    }
//
//                    ForEach(cookingInstructions.indices, id: \.self) { i in
//                        Text("\(i + 1). \(cookingInstructions[i])")
//                    }
//                }
//
//                Divider()
//
//                Button(action: saveRecipe) {
//                    Text("Save Recipe")
//                        .font(.headline)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.green.opacity(0.8))
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//            }
//            .padding()
//        }
//      
//    }
//
//    
//    private func saveRecipe() {
//        guard !name.isEmpty else { return }
//
//        let newFood = AfricanFood(
//            name: name,
//            description: descriptionFood,
//            ingredients: ingredients,
//            preparationTime: preparationTime,
//            region: region,
//            imageURL: imageURL,
//            cookingInstructions: cookingInstructions,
//            defaultServings: defaultServings
//        )
//
//        context.insert(newFood)
//        do {
//            try context.save()
//            service.foods.append(newFood) 
//            dismiss()
//        } catch {
//            print(" Failed to save recipe: \(error)")
//        }
//    }
//}
//
//#Preview {
//    AddingANewRecipe(service: AfricanFoodService())
//}

import SwiftUI
import SwiftData

struct AddingANewRecipe: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    // Recipes
    @State private var name = ""
    @State private var descriptionFood = ""
    @State private var region = ""
    @State private var preparationTime = ""
    @State private var imageURL = ""
    @State private var defaultServings = 2

    // Ingredients
    @State private var ingredients: [Ingredient] = []
    @State private var ingredientName = ""
    @State private var ingredientQuantity = ""
    @State private var ingredientUnit = ""

    // Cooking
    @State private var cookingInstructions: [String] = []
    @State private var instructionText = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Recipe Info")) {
                    TextField("Dish Name", text: $name)
                    TextField("Description", text: $descriptionFood)
                    TextField("Region", text: $region)
                    TextField("Preparation Time", text: $preparationTime)
                    TextField("Image URL", text: $imageURL)
                    Stepper("Servings: \(defaultServings)", value: $defaultServings, in: 1...20)
                }

             
                Section(header: Text("Ingredients")) {
                    HStack {
                        TextField("Name", text: $ingredientName)
                        TextField("Qty", text: $ingredientQuantity)
                            .keyboardType(.decimalPad)
                            .frame(width: 60)
                        TextField("Unit", text: $ingredientUnit)
                            .frame(width: 80)
                        Button(action: addIngredient) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                        }
                        .buttonStyle(.plain)
                    }

                    if ingredients.isEmpty {
                        Text("No ingredients added yet.")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(ingredients.indices, id: \.self) { i in
                            Text("• \(ingredients[i].quantity) \(ingredients[i].unit) \(ingredients[i].name)")
                        }
                        .onDelete(perform: deleteIngredient)
                    }
                }

               
                Section(header: Text("Cooking Instructions")) {
                    HStack {
                        TextField("Add an instruction", text: $instructionText)
                        Button(action: addInstruction) {
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.orange)
                        }
                        .buttonStyle(.plain)
                    }

                    if cookingInstructions.isEmpty {
                        Text("No steps added yet.")
                            .foregroundColor(.secondary)
                    } else {
                        ForEach(cookingInstructions.indices, id: \.self) { i in
                            Text("\(i + 1). \(cookingInstructions[i])")
                        }
                        .onDelete(perform: deleteInstruction)
                    }
                }
            }
            .navigationTitle("New Recipe 🥘")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        saveRecipe()
                    } label: {
                        Label("Save", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }

    
    private func addIngredient() {
        guard let qty = Double(ingredientQuantity), !ingredientName.isEmpty else { return }
        let newIngredient = Ingredient(name: ingredientName, quantity: qty, unit: ingredientUnit)
        ingredients.append(newIngredient)
        ingredientName = ""
        ingredientQuantity = ""
        ingredientUnit = ""
    }
    
    private func deleteIngredient(at offsets: IndexSet) {
        ingredients.remove(atOffsets: offsets)
    }
    
    private func addInstruction() {
        guard !instructionText.isEmpty else { return }
        cookingInstructions.append(instructionText)
        instructionText = ""
    }

    private func deleteInstruction(at offsets: IndexSet) {
        cookingInstructions.remove(atOffsets: offsets)
    }

    private func saveRecipe() {
        guard !name.isEmpty else { return }

        let newFood = AfricanFood(
            name: name,
            description: descriptionFood,
            ingredients: ingredients,
            preparationTime: preparationTime,
            region: region,
            imageURL: imageURL,
            cookingInstructions: cookingInstructions,
            defaultServings: defaultServings
        )

        context.insert(newFood)
        do {
            try context.save()
            
            dismiss()
        } catch {
            print("Failed to save recipe: \(error)")
        }
    }
}

#Preview {
    AddingANewRecipe()
}
