//
//  CovidManager.swift
//  PM2_practica9COVIDAPI
//
//  Created by Alexander Tapia on 25/04/22.
//

import Foundation

protocol covidManagerDelegado{
    func actualizar()
}
struct CovidManager{
    var delegado: covidManagerDelegado?
    
    func buscarEstadisticas(){
        let urlString = "https://corona.lmao.ninja/v3/covid-19/countries/"
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                if error != nil{
                    print()
                }
                if let datosSeguros = datos{
                    print("datos seguros")
                    print(datosSeguros)
                    print("respuesta\(respuesta)")
                }
            
            }
            tarea.resume()
        }
    }
    func parcearJSON(datosCovid: Data) -> [CovidDatos]?{
        let decodificador = JSONDecoder()
        do{
            let datosDecodificados: [CovidDatos] = try decodificador.decode([CovidDatos].self, from: datosCovid)
            
            let paises:[CovidDatos] = datosDecodificados
            
            
            return paises
        }catch{
            print("error: \(error.localizedDescription)")
            return nil
        }
    }
}
