//
//  HomeView.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                HomeCountryCell(country: .previewData)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
