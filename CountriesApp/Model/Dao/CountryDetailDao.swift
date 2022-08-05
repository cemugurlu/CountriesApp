//
//  CountryDetailDao.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import Foundation

struct CountryDetailDao: Codable {
    let data: CountryDataDao
}

struct CountryDataDao: Codable {
    let capital, code, callingCode: String
    let currencyCodes: [String]
    let flagImageURI: String
    let name: String
    let numRegions: Int
    let wikiDataID: String

    enum CodingKeys: String, CodingKey {
        case capital, code, callingCode, currencyCodes
        case flagImageURI = "flagImageUri"
        case name, numRegions
        case wikiDataID = "wikiDataId"
    }
}
