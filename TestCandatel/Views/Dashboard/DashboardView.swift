//
//  DashboardView.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                   
                    HeaderView()
                    
         
                    DoctorAppointmentCard()
                    
              
                    CategorySection()
                    
                
                    SectionView(title: "Frequently Used", items: frequentlyUsedItems)
                    
                
                    SectionView(title: "Financial Services", items: financialServiceItems)
                }
                .padding()
            }
            .background(Color(.systemGray6))
    }
}




let frequentlyUsedItems = [
    ServiceItem(iconName: "phone.fill", title: "Caller ID"),
    ServiceItem(iconName: "creditcard.fill", title: "Credit Champ"),
    ServiceItem(iconName: "arrow.right.circle.fill", title: "Bank Transfer"),
    ServiceItem(iconName: "dollarsign.circle.fill", title: "Request Money"),
    ServiceItem(iconName: "dollarsign.circle.fill", title: "Request Money")
]

let financialServiceItems = [
    ServiceItem(iconName: "chart.bar.fill", title: "Transaction History"),
    ServiceItem(iconName: "dollarsign.circle.fill", title: "Request Money"),
    ServiceItem(iconName: "creditcard.fill", title: "Credit Champ"),
    ServiceItem(iconName: "arrow.right.circle.fill", title: "Bank Transfer"),
    ServiceItem(iconName: "arrow.right.circle.fill", title: "Bank Transfer")
]

// Preview
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

