//
//  DetailViewController.swift
//  Navegacion
//
//  Created by Kenyi Rodriguez on 20/09/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBAction func clickBtnClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.showAlertWithTitle("MI ALERTA", message: "Hola, esta es mi primera alerta", accept: "Aceptar")
    }
}
