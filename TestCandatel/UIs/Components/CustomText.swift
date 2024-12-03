//
//  CustomText.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI



import SwiftUI

struct CustomText: View {
    let text: String
    let fontSize: CGFloat
    let fontWeight: Font.Weight
    let textColor: Color
    init(_ text: String, fontSize: CGFloat = 16, fontWeight: Font.Weight = .regular,textColor: Color = .white) {
        self.text = text
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.textColor = textColor
    }

    var body: some View {
        Text(text)
            .font(.system(size: fontSize, weight: fontWeight))
            .foregroundColor(textColor)
    }
}



