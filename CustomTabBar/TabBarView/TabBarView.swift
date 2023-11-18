
//  CustomTabBarView.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 23/06/23.


import SwiftUI
struct TabBarView: View {
    
    // State object to manage tab bar state
    @StateObject private var tabBarVM = TabBarViewModel()
    @State private var isKeyboardVisible = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView(selection: $tabBarVM.activeTab) {
                
                TabCard(tab: Tab.home)
                    .tag(Tab.home)
                
                TabCard(tab: Tab.favorites)
                    .tag(Tab.favorites)
                
                SearchView()
                    .tag(Tab.search)
                
                TabCard(tab: Tab.profile)
                    .tag(Tab.profile)
                
            }
          
            //  Custom tab bar at the bottom
            CustomShapedTabBar(activeTab: $tabBarVM.activeTab,
                         tabShapePosition: $tabBarVM.tabShapePosition)
            .background(.ultraThinMaterial)
            .frame(height: 0)
            .opacity(isKeyboardVisible ? 0 : 1)
            //.padding(.bottom, 10)
        }
        
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                   withAnimation {
                       isKeyboardVisible = true
                   }
               }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                   withAnimation {
                       isKeyboardVisible = false
                   }
               }
        
        .onAppear {
            UITabBar.appearance().isHidden = true
        }
        
    }
}

#Preview {
  TabBarView()
}

struct SearchView: View {
    @State private var searchText : String = ""
    var body: some View {
        NavigationStack {
            VStack {
                TabCard(tab: Tab.search)
            }
            .searchable(text: $searchText,prompt: "Search here!")
        }
    }
}



