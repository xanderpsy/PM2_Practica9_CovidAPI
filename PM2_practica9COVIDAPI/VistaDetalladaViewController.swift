//
//  VistaDetalladaViewController.swift
//  PM2_practica9COVIDAPI
//
//  Created by Alexander Tapia on 03/05/22.
//

import UIKit

class VistaDetalladaViewController: UIViewController {
    var recibirPais: CovidDatos?
    
    @IBOutlet weak var labelNombre: UILabel!
    @IBOutlet weak var labelRecovery: UILabel!
    @IBOutlet weak var labelTodayCases: UILabel!
    @IBOutlet weak var labelCritical: UILabel!
    @IBOutlet weak var labelActive: UILabel!
    @IBOutlet weak var labelTodayDeaths: UILabel!
    @IBOutlet weak var labelDeaths: UILabel!
    @IBOutlet weak var labelCases: UILabel!
    @IBOutlet weak var imgBandera: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cargarDatos()
        // Do any additional setup after loading the view.
    }
    

    func cargarDatos(){
            if let urlString = recibirPais?.countryInfo?.flag{
                if let imagenURL = URL(string: urlString){
                    DispatchQueue.global().async {
                        guard let imagenData = try? Data(contentsOf: imagenURL) else {return}
                        let image = UIImage(data: imagenData)
                        DispatchQueue.main.async {
                            self.imgBandera.image = image
                        }
                    }
                }
            }
        labelNombre.text = recibirPais?.country
        labelRecovery.text = "Recuperados \(recibirPais?.recovered ?? 0)"
        labelTodayCases.text = "Casos de hoy \(recibirPais?.todayCases ?? 0)"
        labelCritical.text = "Criticos \(recibirPais?.deaths ?? 0)"
        labelActive.text = "Activos \(recibirPais?.todayDeaths ?? 0)"
        labelTodayDeaths.text = "Muertes de hoy \(recibirPais?.active ?? 0)"
        labelDeaths.text = "Muertes \(recibirPais?.critical ?? 0)"
        labelCases.text = "Casos \(recibirPais?.cases ?? 0)"
            
        }

}
