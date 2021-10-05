//
//  ViewController.swift
//  Observador
//
//  Created by Kenyi Rodriguez on 27/09/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var anchorContentCenterY: NSLayoutConstraint!
    @IBOutlet weak var viewContent: UIView!
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.closeKeyboard()
    }
    
    @IBAction func swipeToCloseKeyboard(_ sender: Any) {
        self.closeKeyboard()
    }
    
    @IBAction func swipeToOpenKeyboard(_ sender: Any) {
        self.txtUser.becomeFirstResponder()
    }
    
    @IBAction func clickBtnLogin(_ sender: Any) {
        
        guard let user = self.txtUser.text, user.count != 0 else {
            self.showAlertWithTitle("Error", message: "Ingrese un usuario correcto", accept: "Aceptar")
            return
        }
        
        guard let password = self.txtPassword.text, password.count != 0 else {
            self.showAlertWithTitle("Error", message: "Ingrese una contraseña válida", accept: "Aceptar")
            return
        }
        
        //Consumiremos el servicio web
        //Esperaremos a que responda
        //Si la respuesta es correcta, entonces vamos al home
        self.performSegue(withIdentifier: "HomeViewController", sender: nil)
        //Si la respuesta es incorrecta, mostramos un mensaje de error
    }
    
    private func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    private func clearAllFields() {
        self.txtUser.text = nil
        self.txtPassword.text = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.clearAllFields()
        self.registerKeyboardEvents()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardEvents()
    }
}

extension LoginViewController {
    
    private func registerKeyboardEvents() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func unregisterKeyboardEvents() {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        let finalPosYContent = self.viewContent.frame.origin.y + self.viewContent.frame.height
        
        if keyboardFrame.origin.y < finalPosYContent {
            
            UIView.animate(withDuration: animationDuration, delay: 0, options: [.curveEaseInOut], animations: {
                self.anchorContentCenterY.constant = keyboardFrame.origin.y - finalPosYContent
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration) {
            self.anchorContentCenterY.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
