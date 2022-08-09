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
    
    static var previewData: CountryDetailModel {
        return .init(code: "TR",
                     flagImageUrl: "http://commons.wikimedia.org/wiki/Special:FilePath/Flag%20of%20the%20United%20States.svg",
                     wikiDataId: "Q43")
    }
}

extension CountryDetailModel {
    init(dao: CountryDataDao) {
        code = dao.code
        flagImageUrl = dao.flagImageURI
        wikiDataId = dao.wikiDataID
    }
}
