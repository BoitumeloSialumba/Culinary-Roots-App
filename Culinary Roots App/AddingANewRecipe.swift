//
//  AddingANewRecipe.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//

import SwiftUI
import SwiftData


struct AddingANewRecipe: View {
    @State private var DishName: String = ""
    @State private var Description: String = ""
    @State private var Ingredients: String = ""
    @State private var Preparation: String = ""
    @State private var PreparationTime: String = ""
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text(" Dish Name")){
                    TextField(" Dish Name", text: $DishName)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $Description)
                }
                
                Section(header: Text("Ingredients")) {
                    TextEditor(text: $Ingredients)
                }
                
                Section(header: Text("Preparation Steps")) {
                    TextEditor(text: $Preparation)
                }
                Section(header: Text("Preparation Time")) {
                    TextField("",text: $PreparationTime)
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Label("Cancel",systemImage:"xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                ToolbarItem{
                    Button {
                       
                        let ingredientList = Ingredients
                            .split(separator: ",")
                            .map { Ingredient(name: String($0).trimmingCharacters(in: .whitespaces), quantity: 0, unit: "") }
                        
                        let newRecipe = AfricanFood(
                            name: DishName,
                            description: Description,
                            ingredients: ingredientList,
                            preparationTime: PreparationTime,
                            region: "Custom",
                            imageURL: "",
                            cookingInstructions: Preparation
                                .split(separator: "\n")
                                .map { String($0) },
                            defaultServings: 1
                        )
                    
                        context.insert(newRecipe)
                        do {
                            try context.save()
                            dismiss()
                        } catch {
                            print("Failed to save new recipe: \(error)")
                        }

                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(DishName.isEmpty)

                }
            })
            .navigationBarTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
        
    }
}

#Preview {
    AddingANewRecipe()
}
