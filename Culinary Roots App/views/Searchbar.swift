//
//  Searchbar.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//



import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearchButtonClicked: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search foods...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onSubmit {
                    onSearchButtonClicked()
                }
            
            Button("Search") {
                onSearchButtonClicked()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal)
    }
}


#Preview {
    @Previewable @State var searchText = "Sadza"
    return SearchBar(
        text: .constant(""),
        onSearchButtonClicked: {
            print("Search button clicked")
        }
    )}

