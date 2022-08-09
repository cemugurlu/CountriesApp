//
//  ContentView.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                    
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
        }
        .onAppear(perform: onAppear)
        .accentColor(.white)
    }
    
    private func onAppear() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .gray
        MainRepository.shared.fetchCountries()
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
