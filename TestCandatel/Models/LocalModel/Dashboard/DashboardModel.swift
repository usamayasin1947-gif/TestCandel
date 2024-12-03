//
//  DashboardModel.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import Foundation

struct storyModel : Identifiable{
    var id: UUID = UUID(uuidString: "sd") ?? UUID()
    
    let name: String
    var isStory: Bool = true
}
struct ServiceItem: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
}
