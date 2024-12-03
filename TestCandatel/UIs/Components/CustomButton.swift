//
//  CustomButton.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI


struct CustomButtonLabel: View {
    var title: String = ""
    var icon : String = "BiometricIcon"
    var isInverseStyle : Bool = false
    var isIconShow : Bool = false
    var isTextShow : Bool = true
    var body: some View {
        HStack(spacing:6){
            if isIconShow{
                Image(icon)
                    .resizable()
                    .frame(width: 18,height: 18)
            }
            if isTextShow{
                Text(title)
                    .font(.system(size: 16))
            }
               
        }
        .frame(height: 34)
        .frame(maxWidth: .infinity)
        .background(isInverseStyle ? .white :Color(hex:"#003465"))
        .foregroundColor( isInverseStyle ? Color(hex:"#003465") : .white)
        .cornerRadius(6)
    }
}

