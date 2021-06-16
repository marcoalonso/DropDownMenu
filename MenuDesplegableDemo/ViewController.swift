//
//  ViewController.swift
//  MenuDesplegableDemo
//
//  Created by marco rodriguez on 15/06/21.
//

import UIKit
import DropDown

class ViewController: UIViewController {
    
    @IBOutlet weak var VistaMenuTop: UIView!
    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = [
            "Pagina1",
            "Pagina2",
            "Pagina3",
            "Pagina4",
            "Pagina5",
            "Pagina6",
        ]
        
        let imagenes = [
            "person",
            "book",
            "folder",
            "house",
            "gear",
            "car",
        ]
        menu.cellNib = UINib(nibName: "DropDownCell", bundle: nil)
        menu.customCellConfiguration = { indice, titulo, cell in
            guard let cell = cell as? MiPantalla else {
                return
            }
            cell.miIcono.image = UIImage(systemName: imagenes[indice])
        }
        return menu
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let vistaTop = VistaMenuTop else {
            return
        }
        
        //agregar una vista donde se mostrará el menú desplegable
        menu.anchorView = vistaTop
        let gestura = UITapGestureRecognizer(target: self, action: #selector(elementoSeleccionado))
        gestura.numberOfTapsRequired = 1
        gestura.numberOfTouchesRequired = 1
        vistaTop.addGestureRecognizer(gestura)
        
        //Acciones del menú
        
        menu.selectionAction = { indice, titutlo in
            self.performSegue(withIdentifier: "\(indice)", sender: self)
            print("indice: \(indice) titulo: \(titutlo)")
        }
    }
    
    @objc func elementoSeleccionado() {
        menu.show()
    }


}

