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
        let urlString = ""
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                if error != nil{
                    print()
                }
                if let datosSeguros = datos{
                    
                }
            
            }
            tarea.resume()
        }
    }
}
