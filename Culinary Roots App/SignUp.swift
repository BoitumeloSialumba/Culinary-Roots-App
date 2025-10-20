//
//  SignUp.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 17/10/2025.
//

import SwiftUI

struct SignUp: View {
    @State private var name : String = ""
    @State private var password : String = ""
    @State private var email : String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                
                LinearGradient(
                    colors: [
                        Color(red: 1.0, green: 0.97, blue: 0.91),
                        Color(red: 0.96, green: 0.85, blue: 0.60)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                   
                    Text("Sign up")
                        .font(Font.system(size: 60, weight: .bold))
                        .foregroundColor(Color(red: 0.35, green: 0.18, blue: 0.05))
                        .padding(.top, 60)
                    
                    
                    Text("Savour the flavours, taste the tales every recipe is a trip back to your roots.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.24, green: 0.12, blue: 0.04))
                        .padding(.horizontal, 30)
                        .padding(.bottom, 10)
                    
                   
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 0.35, green: 0.18, blue: 0.05), lineWidth: 1.5)
                        )
                        .padding(.horizontal, 30)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 0.35, green: 0.18, blue: 0.05), lineWidth: 1.5)
                        )
                        .padding(.horizontal, 30)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 0.35, green: 0.18, blue: 0.05), lineWidth: 1.5)
                        )
                        .padding(.horizontal, 30)
                        .padding(.bottom, 20)
                    
                   
                    NavigationLink(destination: HomePage()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(red: 0.35, green: 0.18, blue: 0.05))
                                .frame(width: 180, height: 50)
                                .shadow(radius: 5)
                            
                            Text("Next")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 30)

                    Spacer()
                }
                .offset(y:100)
            }
        }
    }
}

#Preview {
    SignUp()
}
