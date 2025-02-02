//
//  progressCompletedView.swift
//  LoadingViews
//
//  Created by Pranav Ray on 22/01/25.
//

import SwiftUI

struct progressCompletedView: View {
    @State private var progress: CGFloat = 0.0
    @State private var isAnimating = false
    
    private let gradient = LinearGradient(
        colors: [
            Color(red: 0.7, green: 0.93, blue: 1.0),
            Color(red: 0.95, green: 0.98, blue: 1.0)
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        ZStack {
            
            gradient
                .ignoresSafeArea()
 
            Circle()
                .stroke(
                    Color(red: 0.9, green: 0.95, blue: 1.0),
                    lineWidth: 20
                )
                .frame(width: 200, height: 200)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color(red: 0.4, green: 0.6, blue: 1.0),
                    style: StrokeStyle(
                        lineWidth: 20,
                        lineCap: .round
                    )
                )
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            Text("\(Int(progress * 100))%")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(Color(red: 0.4, green: 0.6, blue: 1.0))
                .animation(.none, value: progress)
        }
        .onAppear {
            startLoading()
        }
    }
    
  func startLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            if progress < 1.0 {
                progress += 0.01
            } else {
                timer.invalidate()
            }
        }
    }
}

#Preview{
  progressCompletedView()
}
