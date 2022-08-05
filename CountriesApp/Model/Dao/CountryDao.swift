//
//  CountryDao.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//
import Foundation

struct CountryDao: Codable {
    let data: [CountryDatumDao]
    let links: [CountryLinkDao]
    let metadata: CountryMetadata
}

struct CountryDatumDao: Codable {
    let code: String
    let currencyCodes: [String]
    let name, wikiDataID: String

    enum CodingKeys: String, CodingKey {
        case code, currencyCodes, name
        case wikiDataID = "wikiDataId"
    }
}

struct CountryLinkDao: Codable {
    let rel, href: String
}

struct CountryMetadata: Codable {
    let currentOffset, totalCount: Int
}
