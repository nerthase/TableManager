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
    
    var blockText: Blocks.stringBlock?
    
    func build(placeholder: String?, text: String?, keyboardType: UIKeyboardType, isSecureTextEntry: Bool, block: Blocks.stringBlock?) {
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

class CellFieldManager: CellManager {
    
    var placeholder: String?
    var text: String?
    var keyboardType: UIKeyboardType = .default  // Necessario per poi passarlo a CellField
    var isSecureTextEntry: Bool = false  // Necessario per poi passarlo a CellField
    
    var blockText: Blocks.stringBlock?
    
    init(placehoder: String?, text: String?, keyboardType: UIKeyboardType = .default, isSecureTextEntry: Bool = false, block: Blocks.stringBlock?) {
        self.placeholder = placehoder
        self.text = text
        
        self.keyboardType = keyboardType
        self.isSecureTextEntry = isSecureTextEntry
        
        self.blockText = block
    }
    
    func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(CellField.self)
        
        let cell: CellField = tableView.deque(indexPath)
        cell.build(placeholder: self.placeholder, text: self.text, keyboardType: self.keyboardType, isSecureTextEntry: self.isSecureTextEntry, block: {
            self.text = $0  // Necessario per mantenere aggiornato CellFieldManager, che altrimenti continuerebbe ad avere un valore vecchio
            self.blockText?($0)
        })
        return cell
    }
}
