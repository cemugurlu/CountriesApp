//
//  CountryModel.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import Foundation

struct CountryModel {
    var code: String
    var name: String

    static var previewData: CountryModel {
        return .init(
            code: "US",
            name: "Great United States of America"
        )
    }
}

extension CountryModel {
    init(dao: CountryDatumDao) {
        code = dao.code
        name = dao.name
    }
}
