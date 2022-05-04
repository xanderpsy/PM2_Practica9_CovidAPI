//
//  ViewController.swift
//  PM2_practica9COVIDAPI
//
//  Created by Alexander Tapia on 25/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tablaPaises: UITableView!
    var covidManager = CovidManager()
        var paisAMandar: CovidDatos?
        var paisesTabla:[CovidDatos] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tablaPaises.register(UINib(nibName: "CeldaPaissTableViewCell", bundle: nil), forCellReuseIdentifier: "celda")
                tablaPaises.delegate = self
                tablaPaises.dataSource = self
                covidManager.delegado = self
                covidManager.buscarEstadisticas()
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paisesTabla.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaPaises.dequeueReusableCell(withIdentifier: "celda", for:indexPath) as! CeldaPaissTableViewCell
        
        celda.lblNombrePaisCelda.text = paisesTabla[indexPath.row].country
        celda.lblCasosActivosCelda.text = "Casos activos: \(paisesTabla[indexPath.row].active ?? 0)"
        celda.lblCasosRecuperadosCelda.text = "Casos recuperados \(paisesTabla[indexPath.row].recovered ?? 0)"
        if let urlString = paisesTabla[indexPath.row].countryInfo?.flag{
            if let imagenURL = URL(string: urlString){
                DispatchQueue.global().async {
                    guard let imagenData = try? Data(contentsOf: imagenURL) else {return}
                    let image = UIImage(data:imagenData)
                    DispatchQueue.main.async {
                        celda.imgCelda.image = image
                    }
                }
            }
            
        }
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tablaPaises.deselectRow(at: indexPath, animated: true)
        paisAMandar = paisesTabla[indexPath.row]
        performSegue(withIdentifier: "verDetalle", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verDetalle"{
            let objDestino = segue.destination as! VistaDetalladaViewController
            objDestino.recibirPais = paisAMandar
            
        }
    }
    
}

extension ViewController: covidManagerprotocol{
    func cargarDatos(paises: [CovidDatos]) {
        paisesTabla = paises
        DispatchQueue.main.async {
            self.tablaPaises.reloadData()
        }
    }
    
    func huboError(cualError: String) {
        print(cualError)
    }
    
    
    
}

