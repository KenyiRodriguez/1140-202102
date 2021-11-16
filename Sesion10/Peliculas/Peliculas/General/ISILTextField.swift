//
//  ISILTextField.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 8/11/21.
//

import UIKit

@IBDesignable class ISILTextField: UITextField {
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
        
        self.borderStyle = .none
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.orange.cgColor
        self.layer.borderWidth = 5
        
        self.layer.shadowColor = UIColor.green.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 1
        
        self.backgroundColor = .white
    }
}
