//
//  CountryModel.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import Foundation

struct CountryModel: Identifiable {
    let id = UUID()
    var code: String
    var name: String
    var isFavorite: Bool

    static var previewData: CountryModel {
        return .init(
            code: "SW",
            name: "Sweden",
            isFavorite: false
            
        )
    }
}

extension CountryModel {
    init(dao: CountryDatumDao) {
        code = dao.code
        name = dao.name
        isFavorite = false
    }
}
