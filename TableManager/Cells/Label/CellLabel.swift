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

class CellLabelManager: CellManager {
    
    var text: String?
    
    init(text: String?) {
        self.text = text
    }
    
    func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(CellLabel.self)
        
        let cell: CellLabel = tableView.deque(indexPath)
        cell.build(text: self.text)
        return cell
    }
}
