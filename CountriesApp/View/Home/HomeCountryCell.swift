//
//  HomeCountryCell.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import SwiftUI

struct HomeCountryCell: View {
    let country: CountryModel
    let onRowTap: () -> Void
    
    var body: some View {
        Button(action: onRowTap) {
            HStack {
                Text(country.name)
                    .foregroundColor(.primary)
                    .font(.title3)
                    .padding()
                
                Spacer()
            }
            .roundedCorner(cornerRadius: 7, color: .gray, lineWidth: 3)
        }
        .overlay(
            Button(action: onStarTap) {
                Image(systemName: country.isFavorite ? "star.fill" : "star")
                    .foregroundColor(country.isFavorite ? .black : .gray)
                    .padding()
            },
            alignment: .trailing)
    }
    
    private func onStarTap() {
        MainRepository.shared.toggleFavorite(country: country)
    }
}

struct HomeCountryCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeCountryCell(country: .previewData) {}
    }
}
