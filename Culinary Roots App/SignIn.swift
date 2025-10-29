//
//  SignIn.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 16/10/2025.
//

import SwiftUI

struct SignIn: View {
    @State private var name : String = ""
    @State private var password : String = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
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
                    Text("Sign In")
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
                        attemptLogin()
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(red: 0.35, green: 0.18, blue: 0.05))
                                .frame(width: 180, height: 50)
                                .shadow(radius: 5)
                            
                            Text("Next")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .disabled(password.isEmpty)
                    }
                    
                    HStack(spacing: 4) {
                        Text("You Don't Have an Account?")
                            .foregroundColor(Color(red: 0.35, green: 0.18, blue: 0.05))
                        
                        NavigationLink(destination: SignUp()) {
                            Text("Sign Up")
                        }
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding(.bottom, 40)
                .offset(y: 100)
            }
            .alert(alertTitle, isPresented: $showAlert) {
                NavigationLink("OK") { }
            } message: {
                Text(alertMessage)
                HomePage()
            }
            
        }
    }
    
    
    private func attemptLogin() {
        if password.count < 8 {
            alertTitle = "That password’s undercooked "
            alertMessage = "👩🏾‍🍳 Try at least 8 characters for the perfect recipe!"
            showAlert = true
            return
        }
        
        let formattedName = name.trimmingCharacters(in: .whitespacesAndNewlines).capitalized
        alertTitle = "Welcome back \(formattedName)!"
        alertMessage = "Yum! Your password’s cooked to perfection 😋"
        
        showAlert = true
    }
}
//}


#Preview {
    SignIn()
}
