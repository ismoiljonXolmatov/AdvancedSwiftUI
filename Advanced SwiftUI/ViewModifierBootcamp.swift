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
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 10)
            
    }
}

extension View {
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonModifier(background: backgroundColor))
    }
}
