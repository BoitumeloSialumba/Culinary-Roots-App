//
//  ContentView.swift
//  Culinary Roots App
//
//  Created by Boitumelo Sialumba on 16/10/2025.
//
import SwiftUI

struct WelcomePage: View {
    @State private var animateLogo = false
    
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
                
                VStack(spacing: 25) {
                    
                    Text("Welcome To")
                        .font(Font.system(size: 40, weight: .bold))
                        .foregroundColor(Color(red: 0.35, green: 0.18, blue: 0.05))
                    
                    
                    Image("Logoo")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .scaleEffect(animateLogo ? 1 : 0.8)
                        .opacity(animateLogo ? 1 : 0)
                        .animation(.spring(response: 1, dampingFraction: 0.6), value: animateLogo)
                    
                    Text("Culinary Roots")
                        .font(Font.system(size: 40, weight: .bold))
                        .foregroundColor(Color(red: 0.35, green: 0.18, blue: 0.05))
                    
                    Text("Savour the flavours, taste the tales every recipe is a trip back to your roots.")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.24, green: 0.12, blue: 0.04))
                        .padding(.horizontal, 30)
                        .offset(y:60)
                    
                    
                    NavigationLink(destination: Text("Next Page Coming Soon")) {
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
            }
            .onAppear {
                animateLogo = true
            }
        }
    }
}

#Preview {
    WelcomePage()
}
