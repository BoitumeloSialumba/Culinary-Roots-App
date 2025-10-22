//
//  AddingANewRecipe.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//

import SwiftUI

struct AddingANewRecipe: View {
    @State private var DishName: String = ""
    @State private var Description: String = ""
    @State private var Ingredients: String = ""
    @State private var Preparation: String = ""
  
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text(" Dish Name")){
                    TextField(" Dish Name", text: $DishName)
                }
                Section(header: Text("Description")){
                    TextField("Description", text: $Description)
                }
                Section(header: Text("Ingredients")){
                    TextField("List The Ingredients", text: $Ingredients)
                }
                Section(header: Text("Preparation")){
                    TextField("Preparation", text: $Preparation)
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
                   
                    Button{
                        
                    }label: {
                        Label("Done",systemImage:"checkmark")
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
