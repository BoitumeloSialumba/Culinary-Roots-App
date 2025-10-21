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
    var body: some View {
        NavigationStack {
            VStack {
                SearchBar(text: $searchText, onSearchButtonClicked: {
                    foodService.searchFoods(query: searchText)
                })
            }
            Group {
                if foodService.isLoading {
                    ProgressView("Loading African Foods...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    FoodListView(foods: foodService.foods)
                }
            }
            .navigationTitle("🌍 African Foods")
        }
        .onAppear {
            foodService.loadFoods()
        }
//        Button{
//            
//        }label:{
//            VStack{
//                HStack{
//                    Spacer()
//                    Image(systemName:"plus.circle.fill")
//                }
//                .padding()
//                Spacer()
//            }
//            
//        }
   }
}

#Preview {
    ContentView()
}
