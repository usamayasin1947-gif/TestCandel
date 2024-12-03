//
//  AppointmentCardView.swift
//  TestCandatel
//
//  Created by osamaYasin on 12/2/24.
//

import SwiftUI

struct DoctorAppointmentCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60, height: 60)
                    .overlay(
                        Image(.womenIcon)
                            .resizable()
                            .scaledToFill() // Scale the image to fill the circle
                            .frame(width: 60, height: 60)
                            .clipShape(Circle()) // Clip the image to fit inside the circle
                    )
                
                VStack(alignment: .leading) {
                    CustomText("Dr. A Syahir,",fontSize: 22,fontWeight: .bold)
                       
                    CustomText("General Doctor",fontSize: 16,textColor: Color(hex:"#CBE1FF"))
                
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.white)
                    .font(.system(size: 12))
            }
            .padding()
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)

            
            Divider()
                .frame(height: 1)
                .foregroundColor(Color.white.opacity(0.2))
                .padding(.horizontal,10)
            HStack {
                HStack {
                    Image(systemName: "calendar")
                    CustomText("Sunday, 12 June",fontSize: 14)
                }
                Spacer()
                HStack {
                    Image(systemName: "clock")
                    CustomText("11:00 - 12:00 AM",fontSize: 14)
                }
            }
            .foregroundColor(Color.white)
            .padding([.leading, .trailing, .bottom])
        }
        .background(Color(hex:"#4894FE"))
        .cornerRadius(15)
    }
    
}
