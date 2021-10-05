//
//  HomeViewController.swift
//  Observador
//
//  Created by Kenyi Rodriguez on 4/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBAction func clickBtnCloseSession(_ sender: Any) {
        
        let controller = UIAlertController(title: "Mi App", message: "¿Estas seguro que deseas cerrar sesión?", preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: "Aceptar", style: .default) { action in
            self.navigationController?.popToRootViewController(animated: true)
        }
        controller.addAction(acceptAction)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        
        self.present(controller, animated: true, completion: nil)
    }
}
