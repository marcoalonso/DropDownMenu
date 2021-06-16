//
//  MiPantalla.swift
//  MenuDesplegableDemo
//
//  Created by marco rodriguez on 15/06/21.
//

import UIKit
import DropDown

class MiPantalla: DropDownCell {
    
    
    @IBOutlet weak var miIcono: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        miIcono.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
