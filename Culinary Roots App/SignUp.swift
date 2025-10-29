//
//  SignUp.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 17/10/2025.
//

import SwiftUI

struct SignUp: View {
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var showAlert2 = false
    @State private var alertTitle2 = ""
    @State private var alertMessage2 = ""
    @State private var navigateToContentView = false
    
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
                        .font(.system(size: 60, weight: .bold))
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
                    
                    Button(action: {
                        attemptLogin2()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(red: 0.35, green: 0.18, blue: 0.05))
                                .frame(width: 180, height: 50)
                                .shadow(radius: 5)
                            
                            Text("Next")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                    }
                    .padding(.top, 30)
                    
                    Spacer()
                }
                .offset(y: 100)
            }
            
            .navigationDestination(isPresented: $navigateToContentView) {
                ContentView()
            }
            
            .alert(alertTitle2, isPresented: $showAlert2) {
                Button("OK") {
                    if alertTitle2.starts(with: "Delicious") {
                        navigateToContentView = true
                    }
                }
            } message: {
                Text(alertMessage2)
            }
        }
    }
    
    
    func attemptLogin2() {
        if password.count < 8 {
            alertTitle2 = "That password’s undercooked 👩🏾‍🍳"
            alertMessage2 = "Try at least 8 characters for the perfect recipe!"
            showAlert2 = true
            return
        }
        
        alertTitle2 = "Delicious! You’re all set🍴"
        alertMessage2 = "Welcome to Culinary Roots where every recipe tells a story and every flavour takes you home."
        showAlert2 = true
    }
}

#Preview {
    SignUp()
}
