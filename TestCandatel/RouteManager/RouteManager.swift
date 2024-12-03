//
//  RouteManager.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/3/24.
//

import Foundation


class RouteManager: ObservableObject {
    
    @Published var isLoggedIn = false{
        didSet{
            UserDefaults.standard.set(isLoggedIn, forKey: "isLogin")
        }
    }
}
