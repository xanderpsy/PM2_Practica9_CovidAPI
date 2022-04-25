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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tablaPaises.delegate = self
        tablaPaises.dataSource = self
        //instanciando
        covidManager.buscarEstadisticas()
    }


}

//func buscarEstadisticas(){
//    let urlString = ""
//
//    if let url = URL(string: urlString){
//        DispatchQueue.global().async {
//            if let imagenData = try? Data(contentsOf: url){
//                let imagen = UIImage(data: imagenData)
//
//                //actualizar La ui
//                DispatchQueue.main.async{
//                    //actualizar la imagen de la celda
//
//                }
//            }//if
//        }
//    }//if
//}
// Alex-tableView
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tablaPaises.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        celda.textLabel?.text = "Mexico"
        celda.detailTextLabel?.text = "345634"
        celda.imageView?.image = UIImage()
        return celda
    }
    
    
    
}

