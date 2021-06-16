//
//  ViewController.swift
//  MenuDesplegableDemo
//
//  Created by marco rodriguez on 15/06/21.
// doc: https://cocoapods.org/pods/DropDown 

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
        menu.backgroundColor = #colorLiteral(red: 0.9930781722, green: 0.7825699449, blue: 0.8652152419, alpha: 1)
        menu.animationduration = 0.5
        menu.width = 200
        menu.direction = .any // .bottom, .top
        menu.dismissMode = .automatic
        menu.textFont = .boldSystemFont(ofSize: 20)
        menu.cellHeight = 80
        menu.cornerRadius = 12
        menu.selectionBackgroundColor = #colorLiteral(red: 0.9907129407, green: 0.6854662299, blue: 0.7990468144, alpha: 1)
        menu.selectedTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
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

