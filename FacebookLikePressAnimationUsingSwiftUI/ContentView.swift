//
//  ContentView.swift
//  FacebookLikePressAnimationUsingSwiftUI
//
//  Created by Ramill Ibragimov on 13.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var x: Int = 0
    @State var finish = false
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Image("smile").resizable().frame(width: 50, height: 50)
                    .offset(y: (self.x == 1 && !self.finish) ? -55 : 0)
                Image("smile").resizable().frame(width: 50, height: 50)
                    .offset(y: (self.x == 2 && !self.finish) ? -55 : 0)
                Image("smile").resizable().frame(width: 50, height: 50)
                    .offset(y: (self.x == 3 && !self.finish) ? -55 : 0)
                Image("smile").resizable().frame(width: 50, height: 50)
                    .offset(y: (self.x == 4 && !self.finish) ? -55 : 0)
                Image("smile").resizable().frame(width: 50, height: 50)
                    .offset(y: (self.x == 5 && !self.finish) ? -55 : 0)
                Image("smile").resizable().frame(width: 50, height: 50)
                    .offset(y: (self.x == 6 && !self.finish) ? -55 : 0)
            }.padding(8)
            .background(RoundedRectangle(cornerRadius: 25).fill(Color("Color")))
            .overlay(Longgesture(x: $x, finish: $finish))
            .animation(.spring())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Longgesture: UIViewRepresentable {
    
    let view = UIView()
    @Binding var x: Int
    @Binding var finish: Bool
    
    func makeCoordinator() -> Longgesture.Coordinator {
        return Longgesture.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<Longgesture>) -> UIView {
        view.addGestureRecognizer(UILongPressGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.long(gesture:))))
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Longgesture>) {
        
    }
    
    class Coordinator: NSObject {
        var parent: Longgesture
        init(parent1: Longgesture) {
            parent = parent1
        }
        
        @objc func long(gesture: UILongPressGestureRecognizer) {
            if gesture.state == .began {
                self.parent.finish = false
                self.parent.x = 0
            }
            
            if gesture.state == .changed {
                let value = gesture.location(in: self.parent.view).x
                
                if value > 0 && value < 58 {
                    self.parent.x = 1
                } else if value > 58 && value < 108 {
                    self.parent.x = 2
                } else if value > 108 && value < 158 {
                    self.parent.x = 3
                } else if value > 158 && value < 208 {
                    self.parent.x = 4
                } else if value > 208 && value < 258 {
                    self.parent.x = 5
                } else if value > 258 && value < 308 {
                    self.parent.x = 6
                }
            }
            
            if gesture.state == .ended {
                self.parent.finish = true
            }
        }
    }
}
