//
//  ContentView.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var foodService = AfricanFoodService()
    @State private var searchText = ""
    @State private var showingAddRecipe = false
    @Query var africanFoods: [AfricanFood]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(
                    text: $searchText,
                    onSearchButtonClicked: {
                        foodService.searchFoods(query: searchText)
                    }
                )
                FoodListView(foods: foodService.foods + africanFoods)
            }
            .navigationTitle("🌍 African Foods")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddingANewRecipe()) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
                    .onAppear {
                        foodService.loadFoods()
                    }
                }
            }
        }
        
        
        
        #Preview {
            ContentView()
        

        }
