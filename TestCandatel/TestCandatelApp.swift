//
//  TestCandatelApp.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI

@main
struct TestCandatelApp: App {
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .navigationViewStyle(.stack)
                .environmentObject(RouteManager())
        }
    }
}
