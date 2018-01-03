//
//  Protocols.swift
//  ProtocolApp
//
//  Created by Andrea & Beatrice on 02/01/18.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import Foundation
import UIKit

protocol CellManager: AnyObject {
    func getCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}


extension CellManager {
    func indexPath(inArray array: [[CellManager]]) -> IndexPath {
        let sectionElement = array.first(where: { (section) -> Bool in
            section.contains(where: { (row) -> Bool in
                row === self
            })
        })
        
        let sectionIndex = array.index(where: { (section) -> Bool in
            section.contains(where: { (row) -> Bool in
                row === self
            })
        })
        
        let rowIndex = sectionElement?.index(where: { (row) -> Bool in
            row === self
        })
        
        guard let section = sectionIndex, let row = rowIndex else { return IndexPath() }
        
        return IndexPath(row: row, section: section)
    }
}
