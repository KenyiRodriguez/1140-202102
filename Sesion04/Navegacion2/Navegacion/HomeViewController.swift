//
//  HomeViewController.swift
//  Navegacion
//
//  Created by Kenyi Rodriguez on 20/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func clickBtnShowAlert(_ sender: Any) {
        self.showAlertWithTitle("MI ALERTA", message: "Hola, esta es mi primera alerta", accept: "Aceptar")
    }
}
