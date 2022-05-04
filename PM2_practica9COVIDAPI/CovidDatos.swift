//
//  CovidDatos.swift
//  PM2_practica9COVIDAPI
//
//  Created by Alexander Tapia on 25/04/22.
//

import Foundation

struct CovidDatos: Decodable{
    let country: String?
    let deaths: Double?
    let todayDeaths: Double?
    let cases: Double?
    let active: Double?
    let critical: Double?
    let todayCases: Double?
    let recovered: Double?
    let countryInfo: CountryInfo?
}

struct CountryInfo: Decodable{
    let flag: String?
}
