//
//  CountryDetailDao.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import Foundation

struct CountryDetailModel {
    var code: String
    var flagImageUrl: String
    var wikiDataId: String
    
    init(dao: CountryDataDao) {
        code = dao.code
        flagImageUrl = dao.flagImageURI
        wikiDataId = dao.wikiDataID
    }
}
