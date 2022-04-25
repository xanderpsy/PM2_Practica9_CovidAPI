//
//  CovidDatos.swift
//  PM2_practica9COVIDAPI
//
//  Created by Alexander Tapia on 25/04/22.
//

import Foundation

struct CovidDAtos: Decodable{
    let country: String?
    let active: Double?
    let countryInfo: CountryInfo?
}

struct CountryInfo: Decodable{
    let flag: String?
}
