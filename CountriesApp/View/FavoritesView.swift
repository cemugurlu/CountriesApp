//
//  FavoritesView.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 9.08.2022.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject private var repository = MainRepository.shared
    
    var body: some View {
        NavigationView {
            CountryListView(countries: repository.countries.filter(\.isFavorite))
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
