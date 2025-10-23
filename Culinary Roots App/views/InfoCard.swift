//
//  InfoCard.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 20/10/2025.
//


import SwiftUI

struct InfoCard: View {
    let title: String
    let value: String
    let icon: String
    
    var body: some View {
            
            VStack {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.caption)
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.12))
            .cornerRadius(8)
        }
    }

