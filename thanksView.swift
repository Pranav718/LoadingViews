
//
//  ContentView.swift
//  test2
//
//  Created by Pranav Ray on 22/01/25.
//

import SwiftUI

import SwiftUI

struct ThanksView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 1.0, green: 0.8, blue: 0.85),
                    Color.white
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                
                Text("Thank you")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(Color(red: 1.0, green: 0.4, blue: 0.6))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white.opacity(0.5))
                            .shadow(color: .pink.opacity(0.3), radius: 10, x: 0, y: 5)
                    )
                
                HeartAnimationView()
            }
        }
    }
}

struct HeartAnimationView: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            ForEach(0..<30) { index in
                Image(systemName: "heart.fill")
                    .foregroundColor(.pink.opacity(0.6))
                    .font(.system(size: 30))
                    .offset(x: animate ? CGFloat.random(in: -150...150) : 30,
                            y: animate ? -UIScreen.main.bounds.height : CGFloat(index % 36 * 100))
                    .animation(
                        .easeInOut(duration: 3)
                        .repeatForever(autoreverses: false)
                        .delay(Double(index) * 0.2),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate.toggle()
        }
    }
}

#Preview {
    ThanksView()
}

