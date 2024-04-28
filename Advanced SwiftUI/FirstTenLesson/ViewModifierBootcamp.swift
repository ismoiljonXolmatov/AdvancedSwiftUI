//
//  ContentView.swift
//  Advanced SwiftUI
//
//  Created by Ismoiljon Xolmatov on 27.04.2024.
//

import SwiftUI

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, world!")
                .font(.headline)
                .withDefaultButtonFormatting()

            Text("Hello, world!")
                .font(.callout)
                .withDefaultButtonFormatting()

            Text("Hello, world!")
                .font(.title)
                .withDefaultButtonFormatting(backgroundColor: .purple)
        }
        .padding(10)
    }
}

#Preview {
    ViewModifierBootcamp()
}

struct DefaultButtonModifier: ViewModifier {
    
    let background: Color
    
    init(background: Color = .blue) {
        self.background = background
    }
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.heavy)
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(
                Color.blue
                    .shadow(.inner(color: .white.opacity(0.4), radius: 10, x: 0, y: 15))
                    .shadow(.drop(color: .black.opacity(0.3), radius: 20, x: 0, y: -10))
            )
            .clipShape(.buttonBorder)
            
    }
}

extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonModifier(background: backgroundColor))
    }
}
