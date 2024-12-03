//
//  PassKeySignIn.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI

struct PassKeySignInView: View {
    @Binding var showSignInPasskey : Bool
    var body: some View {
        VStack(spacing:30){
            VStack(alignment: .leading,spacing:8){
                        CustomText("Passkey Sign in",fontSize: 22,fontWeight: .bold)
                            .frame(maxWidth:.infinity,alignment: .leading)
                        
                        CustomText("Place your finger on the sensor to continue",fontSize: 12)
                    }
                    .padding(.vertical,10)
                    
                    Image("BiometricFull")
                        .resizable()
                        .frame(width: 180,height: 180)
                    Button(action:{
                        withAnimation(.easeInOut(duration: 0.2)) {
                            showSignInPasskey.toggle()
                        }
                    }) {
                        CustomButtonLabel(title: "Cancel")
                    }
                    .padding(.bottom,20)
                }
     
    }
}

#Preview {
    PassKeySignInView(showSignInPasskey: .constant(false))
}
