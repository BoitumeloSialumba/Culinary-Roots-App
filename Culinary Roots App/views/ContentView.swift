//
//  ContentView.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//
import SwiftUI

struct ContentView: View {
    @StateObject var foodService = AfricanFoodService()
    @State private var searchText = ""
    @State private var showingAddRecipe = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(
                    text: $searchText,
                    onSearchButtonClicked: {
                        foodService.searchFoods(query: searchText)
                    }
                )
                FoodListView(foods: foodService.foods)
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
