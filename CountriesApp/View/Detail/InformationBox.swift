//
//  InformationBox.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 9.08.2022.
//

import SwiftUI

struct InformationBox: View {
    @Environment(\.openURL) var openURL
    let countryDetail: CountryDetailModel
    
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text("For more information")
                
                Image(systemName: "arrow.right")
            }
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .cornerRadius(3)
        }
    }
    
    private func onTap() {
        guard let url = URL(string: "https://www.wikidata.org/wiki/\(countryDetail.wikiDataId)") else { return }
        openURL(url)
    }
}

struct InformationBox_Previews: PreviewProvider {
    static var previews: some View {
        InformationBox(countryDetail: .previewData)
    }
}
