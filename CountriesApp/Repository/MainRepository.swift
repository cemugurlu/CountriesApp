//
//  MainRepository.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 5.08.2022.
//

import Foundation

class MainRepository: ObservableObject {
    static let shared = MainRepository()
    @Published var countries = [CountryModel]()
    
    private init() {}
    
    func fetchCountries(completion: @escaping() -> Void) {
        NetworkService.fetchCountries { response in
            guard let model = response else { return completion() }
            self.countries = model.data.map(CountryModel.init)
        }
    }
    
    func fetchCountryDetail(countryCode: String, completion: @escaping (CountryDetailModel?) -> Void) {
        NetworkService.fetchCountryDetails(countryCode: countryCode) { response in
            guard let model = response else { return completion(nil)}
            completion(.init(dao: model.data))
            
        }
    }
    
}
