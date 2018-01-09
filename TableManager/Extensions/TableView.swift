//
//  TableView.swift
//  ProtocolApp
//
//  Created by Andrea & Beatrice on 02/01/18.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ cell: T.Type) {
        self.register(T.nib(), forCellReuseIdentifier: T.identifier())
    }
    
    func deque<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.identifier(), for: indexPath) as! T
    }
    
    
    func prepare<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        self.register(T.self)
        return self.deque(indexPath)
    }
    
}

extension UITableView {
    
    func reload(identifier: String, data: DataSource) {
        let sectionElement = data.first(where: { (section) -> Bool in
            section.contains(where: { (row) -> Bool in
                row.identifier == identifier
            })
        })
        
        let sectionIndex = data.index(where: { (section) -> Bool in
            section.contains(where: { (row) -> Bool in
                row.identifier == identifier
            })
        })
        
        let rowIndex = sectionElement?.index(where: { (row) -> Bool in
            row.identifier == identifier
        })
        
        guard let section = sectionIndex, let row = rowIndex else { return }
        
        self.reloadRows(at: [IndexPath(row: row, section: section)], with: .none)

    }
    
}
