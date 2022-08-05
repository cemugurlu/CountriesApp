//
//  HomeCountryCell.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import SwiftUI

struct HomeCountryCell: View {
    let country: CountryModel
    var body: some View {
        HStack {
            Text(country.name)
                .foregroundColor(.primary)
                .font(.title3)
        }
        
    }
}

struct HomeCountryCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeCountryCell(country: .previewData)
    }
}
