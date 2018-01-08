//
//  CellField.swift
//  ProtocolApp
//
//  Created by Andrea & Beatrice on 02/01/18.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import Foundation
import UIKit

protocol DidChangeCellFieldTextDelegate {
    
}

class CellField: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var blockText: Blocks.string?
    
    func build(placeholder: String?, text: String?, keyboardType: UIKeyboardType, isSecureTextEntry: Bool, block: Blocks.string?) {
        self.label.text = placeholder
        self.textField.placeholder = placeholder
        self.textField.text = text
        
        self.textField.keyboardType = keyboardType
        self.textField.isSecureTextEntry = isSecureTextEntry
        self.textField.delegate = self
        
        self.blockText = block
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.blockText?(textField.text!.replace(range, string: string))
        
        return true
    }
}
