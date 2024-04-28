//
//  ButtonStyleBootcamp.swift
//  Advanced SwiftUI
//
//  Created by Ismoiljon Xolmatov on 28.04.2024.
//

import SwiftUI

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button(action: {
            
        }, label: {
           Text("Press me")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .clipShape(.buttonBorder)
        })
        .withPressableButtonStyle(scaleAmount: 0.99)
        .padding(30)
    }
}

#Preview {
    ButtonStyleBootcamp()
}


extension View {
    func withPressableButtonStyle(scaleAmount: CGFloat = 0.98) -> some View {
        self.buttonStyle(PressableButtonStyle(scaleAmount: scaleAmount))
    }
}


struct PressableButtonStyle: ButtonStyle {
    
    let scaleAmount: CGFloat
    
    init(scaleAmount: CGFloat) {
        self.scaleAmount = scaleAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1)
            .brightness(configuration.isPressed ? 0.2 : 0)
            .background(
                Color.blue
                    .shadow(.inner(color: .white.opacity(0.4), radius: 10, x: 0, y: 15))
                    .shadow(.drop(color: .black.opacity(0.3), radius: 20, x: 0, y: -10))
            )
            .clipShape(.buttonBorder)
            .scaleEffect(configuration.isPressed ? scaleAmount : 1)
    }
}
