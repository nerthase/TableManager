//
//  CellLabel.swift
//  ProtocolApp
//
//  Created by Andrea & Beatrice on 02/01/18.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import Foundation
import UIKit

class CellLabel: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    func build(text: String?) {
        self.label.text = text
    }
}
