//
//  LoginView.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel =  LoginViewModel()
    @State var showSignInPasskey = false
    @EnvironmentObject var routeManager: RouteManager
    var body: some View {
        GradientBackground{
                GradientBorderRectangle{
                    VStack{
                        CustomText("Spiral",fontSize: 26,fontWeight: .bold)
                            .frame(maxWidth:.infinity,alignment: .center)
                        
                        if !showSignInPasskey{
                            CustomText("Login",fontSize: 22)
                                .frame(maxWidth:.infinity,alignment: .leading)
                                .padding(.vertical,10)
                            VStack(spacing:12){
                                CustomTextField(placeholder: "Email", text: $viewModel.email)
                                CustomTextField(placeholder: "Password", text: $viewModel.password, isSecure: true)
                                
                                Button(action: viewModel.login) {
                                    CustomButtonLabel(title: "Sign In")
                                }
                            }
                            VStack(spacing:20){
                                CustomText("or choose",fontSize: 12)
                                    .frame(maxWidth:.infinity,alignment: .center)
                                
                                
                                Button(action: {
                                    withAnimation(Animation.easeInOut(duration: 0.2)){
                                        showSignInPasskey.toggle()
                                    }
                                }) {
                                    CustomButtonLabel(title: "Sign in with Passkey",isInverseStyle: true, isIconShow: true)
                                }
                                
                                HStack(spacing:8){
                                    Button(action: {
                                        SnackbarManager.shared.show(duration: 3.0)
                                    }) {
                                        CustomButtonLabel(icon: "GitIcon", isInverseStyle: true, isIconShow: true)
                                    }
                                    Button(action: {
                                        SnackbarManager.shared.show(duration: 3.0)
                                    }) {
                                        CustomButtonLabel(icon:"GmailIcon", isInverseStyle: true, isIconShow: true)
                                    }
                                }
                                
                                HStack(spacing: 4){
                                    CustomText("Don’t have an account yet?",fontSize: 12)
                                    CustomText("Register for free",fontSize: 12,textColor: Color(hex:"#05FBF3"))
                                        .onTapGesture {
                                            SnackbarManager.shared.show(duration: 3.0)
                                        }
                                    
                                }.frame(maxWidth:.infinity,alignment: .center)
                            }
                            .padding(.vertical,10)
                            .transition(.move(edge: .leading))
                        }
                        else{
                            PassKeySignInView(showSignInPasskey: $showSignInPasskey)
                                .transition(.move(edge: .trailing))
                        }
                        
                        
                    }
                    .padding(.vertical,30)
                    .padding(.horizontal,12)
                    .onReceive(viewModel.$isLogin){
                        isSucess in
                        if isSucess{
                            withAnimation(Animation.easeInOut(duration: 0.3)){
                                routeManager.isLoggedIn = true
                                routeManager.objectWillChange.send()
                            }
                        }
                    }
                }
        
        }
    }
    
   
}




#Preview {
    LoginView()
}


