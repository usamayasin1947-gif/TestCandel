//
//  MainView.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI
struct AppRootView: View{
    @EnvironmentObject var routeManager: RouteManager
    var body: some View {
        NavigationView{
           
                if routeManager.isLoggedIn{
                    DashboardView()
                }else{
                    LoginView()
                }
            }
        
        
    }
}
