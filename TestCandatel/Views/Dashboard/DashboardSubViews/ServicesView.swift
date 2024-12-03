//
//  ServicesView.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI


struct SectionView: View {
    let title: String
    let items: [ServiceItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Text("View all")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 20) {
                    ForEach(items) { item in
                        VStack {
                            Image(systemName: item.iconName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                            
                            Text(item.title)
                                .font(.caption)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
        }
        .padding(.vertical)
    }
}


struct CategorySection: View {
    let categories = ["Meeting", "Hangout", "Cooking", "Other", "Weekend"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Category")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(categories, id: \.self) { category in
                        HStack(spacing: 6){
                            Image(systemName: "dot.square")
                                .foregroundColor(Color.red)
                                .font(.system(size: 10))
                            CustomText(category,textColor: .black)
                               
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color(hex:"#FDF4FF"))
                        .cornerRadius(10)
                        
                    }
                }
            }
        }
    }
}
