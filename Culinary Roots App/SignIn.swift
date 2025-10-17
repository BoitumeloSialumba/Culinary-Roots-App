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
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(
                    colors: [
                        Color(red: 1.0, green: 0.97, blue: 0.91),
                        Color(red: 0.96, green: 0.85, blue: 0.60)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                
                VStack{
                    Text("Sign In")
                        .font(Font.system(size: 60, weight: .bold))
                        .foregroundColor(Color(red: 0.35, green: 0.18, blue: 0.05))
                        .offset(y: -70)
                    Text("Savour the flavours, taste the tales every recipe is a trip back to your roots.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.24, green: 0.12, blue: 0.04))
                        .padding(.horizontal, 30)
                        .offset(y:-40)
                    
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke((Color(red: 0.35, green: 0.18, blue: 0.05)), lineWidth: 1.5)
                        )
                        .padding(.horizontal, 10)
                    
                    TextField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke((Color(red: 0.35, green: 0.18, blue: 0.05)), lineWidth: 1.5)
                        )
                        .padding(.horizontal, 10)
                        .offset(y:40)
                    
                    NavigationLink(destination: SignIn()) {
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
                    .padding(.top, 80)
                }
                .offset(y: 30)
                HStack {
                    Text("You Dont Have an Account?")
                        .offset(y: 300)
                   NavigationLink(destination: SignUp()) {
                           Text("Sign Up")
                               .offset(y: 300)
                    }
                    }
                }
                
            }
        }
       
        }
    

#Preview {
    SignIn()
}
