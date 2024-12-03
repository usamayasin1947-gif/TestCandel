//
//  CustomTextField.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI


struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    @State private var isTextVisible: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            CustomText(placeholder, fontSize: 14)
            
            if isSecure {
                ZStack {
                    if isTextVisible {
                        TextField(placeholder, text: $text)
                            .padding(4)
                            .background(Color.white)
                            .cornerRadius(4)
                            .frame(height: 27)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    } else {
                        SecureField(placeholder, text: $text)
                            .padding(4)
                            .background(Color.white)
                            .cornerRadius(4)
                            .frame(height: 27)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            isTextVisible.toggle()
                        }) {
                            Image(systemName: isTextVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        .padding(.trailing, 8)
                    }
                }
            } else {
                TextField(placeholder, text: $text)
                    .padding(4)
                    .background(Color.white)
                    .cornerRadius(4)
                    .frame(height: 27)
                    .autocapitalization(.none) 
                    .disableAutocorrection(true)
            }
        }
    }
}


//#Preview {
//    CustomTextField(placeholder: "", text: .constant(""))
//}
