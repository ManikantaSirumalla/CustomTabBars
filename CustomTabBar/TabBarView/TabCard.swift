//
//  HomeView.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 19/11/23.
//

import SwiftUI

struct TabCard: View {
    var tab: Tab
    //var color: Color
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: tab.systemImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color.white)
                
                Text(tab.rawValue)
                    .font(.headline).bold()
                    .foregroundColor(.white)
                    .padding(.top, 8)
                
                    
            }
            .navigationTitle(tab.rawValue)
            .padding()
            .frame(width: 350, height: 450)
            .background(tab.TabColor)
            .cornerRadius(16)
        }
    }
}

#Preview {
    TabCard(tab: Tab.favorites)
}
