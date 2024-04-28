//
//  AnyTransitionBootcamp.swift
//  Advanced SwiftUI
//
//  Created by Ismoiljon Xolmatov on 28.04.2024.
//

import SwiftUI

struct AnyTransitionBootcamp: View {
    
    @State var showRectangle: Bool = false
    
    var body: some View {
        
        VStack {
            Spacer()
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/2)
                    .transition(AnyTransition.rotatingOn)
            }
            Spacer()
            
            Button(action: {
                withAnimation(.easeInOut) {
                    showRectangle.toggle()
                }
            }, label: {
                Text("Click me")
                    .withDefaultButtonFormatting()
            })
                .withPressableButtonStyle()
                .padding(.horizontal, 20)
        }
    }
}

#Preview {
    AnyTransitionBootcamp()
}


struct RotateUpViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != .zero ? UIScreen.main.bounds.width : 0,
                y: rotation != .zero ? UIScreen.main.bounds.height : 0)
    }
}

struct RotateDownViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != .zero ? -UIScreen.main.bounds.width : 0,
                y: rotation != .zero ? UIScreen.main.bounds.height : 0)
    }
}

extension AnyTransition {
    static var rotatingUp: AnyTransition {
        AnyTransition.modifier(
            active: RotateUpViewModifier(rotation: 180),
            identity: RotateUpViewModifier(rotation: 0)
        )
    }
    
    static var rotatingDown: AnyTransition {
        AnyTransition.modifier(
            active: RotateDownViewModifier(rotation: -180),
            identity: RotateDownViewModifier(rotation: 0)
        )
    }
    
    static var rotatingOn: AnyTransition {
        AnyTransition.asymmetric(insertion: rotatingUp,
                                 removal: rotatingDown)
    }
}
