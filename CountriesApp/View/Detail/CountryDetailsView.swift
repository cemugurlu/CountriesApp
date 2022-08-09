//
//  CountryDetailsView.swift
//  CountriesApp
//
//  Created by Cem Uğurlu on 9.08.2022.
//

import SwiftUI
import Kingfisher
import SVGKit

struct CountryDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var mainRepository = MainRepository.shared
    @State var country: CountryModel
    @State private var countryDetail: CountryDetailModel? = nil
    @State private var isFetching = false
    @State private var flagImage: UIImage?
    
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Button(action: onBackTap) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                }
                
                Text(country.name)
                    .foregroundColor(.black)
                    .font(.title2)
                    .frame(maxWidth: .infinity)
                
                Button(action: onFavoriteTap) {
                    Image(systemName: country.isFavorite ? "star.fill" : "star")
                        .font(.system(size: 22))
                        .foregroundColor(country.isFavorite ? .black : .gray)
                }
            }
            .padding()
            
            Group {
                if let image = flagImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                }
            }
            .background(Color(white: 0.8))
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 0)
            .padding()
            
            VStack(alignment: .leading, spacing: 30) {
                HStack () {
                    Text("Country Code: ")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(countryDetail?.code ?? "TR")
                    
                }
                .unredacted(when: countryDetail != nil)
                
                InformationBox(countryDetail: countryDetail ?? .previewData)
                    .unredacted(when: countryDetail != nil)
                    .disabled(countryDetail == nil)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: onAppear)
    }
    
    private func onAppear() {
        guard !isFetching else { return }
        isFetching = true
        mainRepository.fetchCountryDetail(countryCode: country.code) { detail in
            countryDetail = detail
            isFetching = false
            if let flagUrlString = countryDetail?.flagImageUrl, let flagUrl = URL(string: flagUrlString) {
                withAnimation {
                    flagImage = SVGKImage(contentsOf: flagUrl).uiImage
                }
            }
        }
    }
    
    private func onBackTap() {
        presentationMode.wrappedValue.dismiss()
    }
    
    private func onFavoriteTap() {
        withAnimation {
            country.isFavorite.toggle()
            mainRepository.toggleFavorite(country: country)
        }
    }
}
struct CountryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailsView(country: .previewData)
    }
}
