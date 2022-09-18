//
//  LoadingView.swift
//  
//
//  Created by Breno Aquino on 08/02/22.
//

import SwiftUI

public enum BackgroundMode {
    case blur
    case opaque
    case clear
}

struct LoadingView: View {
    
    @State private var loadingOpacity: CGFloat = 0
    @State private var startDashCircle: CGFloat = 1
    @State private var mainRotation: Double = 0
    @State private var circleGuiderRotation: Double = -180
    
    private let radius: CGFloat = 100
    let backgroundMode: BackgroundMode
    
    var body: some View {
        ZStack {
            background
                .opacity(loadingOpacity)
                .edgesIgnoringSafeArea(.all)
            
            loading
                .opacity(loadingOpacity)
        }
        .onAppear {
            withAnimation(.linear(duration: .leastNonzeroMagnitude)) {
                self.loadingOpacity = 1
            }
        }
    }
    
    // MARK: Background
    @ViewBuilder private var background: some View {
        switch backgroundMode {
        case .blur:
            Color.red
        case .opaque:
            Color.orange
        case .clear:
            EmptyView()
        }
    }
    
    // MARK: Loading
    private var loading: some View {
        Group {
            mainCircle
            dashCircle
            guidePoint
        }
    }
    
    private var mainCircle: some View {
        Group {
            Circle()
                .frame(width: radius * 0.25, height: radius * 0.25)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 1/2, to: 1)
                .frame(width: radius / 2, height: radius / 2)
                .foregroundColor(.white)
                .rotationEffect(.degrees(mainRotation))
                .onAppear {
                    withAnimation(.linear(duration: 8).repeatForever()) {
                        self.mainRotation = -360
                    }
                }
        }
    }
    
    private var dashCircle: some View {
        Group {
            Circle()
                .stroke(lineWidth: 2)
                .frame(width: radius, height: radius)
                .foregroundColor(.white)
            
            Circle()
                .trim(from: startDashCircle, to: 1)
                .stroke(style: StrokeStyle(lineWidth:5,
                                           lineCap:.round,
                                           lineJoin:.round,
                                           dash: [50, 50],
                                           dashPhase: -50))
                .frame(width: radius * 1.1, height: radius * 1.1)
                .foregroundColor(.white)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .onAppear {
                    withAnimation(.easeInOut(duration: 4).repeatForever()) {
                        self.startDashCircle = 0
                    }
                }
        }
    }
    
    private var guidePoint: some View {
        Group {
            Circle()
                .frame(width: radius * 0.1, height: radius * 0.1)
                .foregroundColor(.white)
                .offset(y: radius / 2 * 1.1)
                .rotationEffect(.degrees(circleGuiderRotation))
                .onAppear {
                    withAnimation(.easeInOut(duration: 4).repeatForever()) {
                        self.circleGuiderRotation = 180
                    }
                }
        }
    }
}


#if DEBUG
// MARK: - Preview
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(backgroundMode: .clear)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
#endif
