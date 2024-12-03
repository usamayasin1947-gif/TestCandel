//
//  BckgroundContent.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI

struct GradientBackground<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            RadialGradient(
                           gradient: Gradient(colors: [Color(hex:"#0085FF"), Color(hex:"#003465")]),
                           center: .center,  
                           startRadius: 0,
                           endRadius: UIScreen.main.bounds.width * 0.7)
                .edgesIgnoringSafeArea(.all)
            content
        }
        .frame(maxHeight: .infinity,alignment: .center)
    }
}


//
import SwiftUI

struct GradientBorderRectangle<Content: View>: View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    @State var textHeight: CGFloat = 0
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(#colorLiteral(red: 0.341, green: 0.509, blue: 0.756, alpha: 0.49)),
                                        Color(#colorLiteral(red: 0.341, green: 0.509, blue: 0.756, alpha: 0.11))
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: 2
                            )
                            .background(Color(#colorLiteral(red: 0.345, green: 0.510, blue: 0.757, alpha: 0.28))) // Semi-transparent background
                            .cornerRadius(24)
                            .opacity(0.5)
            
            
            content
                .overlay(
                              GeometryReader { proxy in
                                Color
                                   .clear
                                   .preference(key: ContentLengthPreference.self,
                                               value: proxy.size.height)
                              }
                           )
          
        }
        .onPreferenceChange(ContentLengthPreference.self) { value in
                DispatchQueue.main.async {
                   self.textHeight = value
                }
              }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: textHeight)
    }
}

struct ContentLengthPreference: PreferenceKey {
   static var defaultValue: CGFloat { 0 }
   
   static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
      value = nextValue()
   }
}
