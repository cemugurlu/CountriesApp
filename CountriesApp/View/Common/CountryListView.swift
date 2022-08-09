//
//  CountryListView.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 9.08.2022.
//

import SwiftUI

struct CountryListView: View {
    let countries: [CountryModel]
    @State private var selectedCountry: CountryModel?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Color.clear.frame(height: 10)
                
                ForEach(countries) { country in
                    HomeCountryCell(country: country, onRowTap: { onCardTap(country) })
                        .padding(.horizontal)
                }
                
                Color.clear.frame(height: 10)
            }
        }
        .fullScreenCover(item: $selectedCountry) { country in
            CountryDetailsView(country: country)
        }
    }
    
    private func onCardTap(_ country: CountryModel) {
        self.selectedCountry = country
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView(countries: [.previewData])
    }
}
