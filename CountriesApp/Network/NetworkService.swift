//
//  NetworkService.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import Foundation
import Alamofire

class NetworkService {
   static let headers: [String: String] = [
        "X-RapidAPI-Key" : Constants.apiKey,
        "X-RapidAPI-Host" : Constants.rapidAPIHost
    ]
    
    static func fetchCountries(completion: @escaping (CountryDao?) -> Void) {
        AF.request("https://wft-geo-db.p.rapidapi.com/v1/geo/countries", parameters: ["limit" : 10],headers: .init(headers))
            .responseDecodable(of: CountryDao.self) { response in
            completion(response.value)
        }
    }
    
    static func fetchCountryDetails(countryCode: String, completion: @escaping (CountryDetailDao?) -> Void) {
        AF.request("https://wft-geo-db.p.rapidapi.com/v1/geo/countries/\(countryCode)", headers: .init(headers))
            .responseDecodable(of:CountryDetailDao.self) { response in
            completion(response.value)
        }
        
    }
}
