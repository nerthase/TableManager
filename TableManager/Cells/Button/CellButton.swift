//
//  CellButton.swift
//  ProtocolApp
//
//  Created by Andrea & Beatrice on 02/01/18.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import Foundation
import UIKit

class CellButton: UITableViewCell {
    
    @IBOutlet weak var button: UIButton!
    
    var actionBlock: Blocks.empty?
    
    func build(text: String?, block: Blocks.empty?) {
        self.button.setTitle(text, for: .normal)
        
        self.actionBlock = block
    }
    
    @IBAction func action(_ sender: Any) {
        self.actionBlock?()
    }
    
}
