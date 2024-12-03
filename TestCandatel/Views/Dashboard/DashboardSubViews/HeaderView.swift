//
//  HeaderView.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import Foundation
import SwiftUI
struct HeaderView: View {
    let users: [storyModel] = [
        storyModel(name: "Selena",isStory: false),
        storyModel(name: "Clara"),
        storyModel(name: "Fabian"),
        storyModel(name: "George")
    ]
    @EnvironmentObject var routeManager: RouteManager
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                VStack(alignment: .leading, spacing: 4){
                    CustomText("Good Morning,",fontSize: 26, textColor: .black)
                    CustomText("Jane",fontSize: 26, fontWeight: .bold,textColor: .black)
                    }.multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity,alignment: .leading)
                Image(.profileIcon)
                    .resizable()
                    .frame(width: 54,height: 54)
                    .frame(maxWidth: .infinity,alignment: .trailing)
                    .onTapGesture {
                        DispatchQueue.main.async {
                            withAnimation(Animation.easeInOut(duration: 0.3)){
                                routeManager.isLoggedIn = false
                            }
                        }
                       
                    }

            }
          
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 20) {
                    ForEach(users) { user in
                        VStack {
                            ZStack {
                               
                                if user.isStory {
                                    Circle()
                                        .stroke(Color.blue, lineWidth: 2)
                                        .frame(width: 68, height: 68)
                                }
                                
                                ZStack{
                                    Circle()
                                        .fill(Color.clear)
                                        .frame(width: 60, height: 60)
                                        .overlay(
                                            Image(.womenIcon)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 60, height: 60)
                                                .clipShape(Circle())
                                        )
                                    
                                    if !user.isStory{
                                        Image(.addStoryIcon)
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .bottomTrailing)
                                    }
                                }
                            }
                            Text(user.name)
                                .font(.caption)
                        }
                    }
                }.padding(.vertical,10)
                    .padding(.horizontal,4)
            }
        }
        .padding(.leading)
    }
}
