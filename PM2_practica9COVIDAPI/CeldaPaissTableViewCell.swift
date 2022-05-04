//
//  CeldaPaissTableViewCell.swift
//  PM2_practica9COVIDAPI
//
//  Created by Alexander Tapia on 02/05/22.
//

import UIKit

class CeldaPaissTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCasosRecuperadosCelda: UILabel!
    @IBOutlet weak var lblNombrePaisCelda: UILabel!
    @IBOutlet weak var imgCelda: UIImageView!
    
    @IBOutlet weak var lblCasosActivosCelda: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
