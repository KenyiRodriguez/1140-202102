//
//  InformationViewController.swift
//  Peliculas
//
//  Created by Angel Kenyi Rodriguez Vergara on 22/11/21.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBAction private func clickBtnCloseSession(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Cerrar sesión", message: "¿Esta seguro que desea cerrar sesión?", preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: "Sí", style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        alertController.addAction(acceptAction)
        
        let cancelAction = UIAlertAction(title: "No", style: .cancel)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
