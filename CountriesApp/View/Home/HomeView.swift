//
//  HomeView.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var mainRepository = MainRepository.shared
    
    var body: some View {
        NavigationView {
            CountryListView(countries: mainRepository.countries)
                .navigationTitle("Countries")
                .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

