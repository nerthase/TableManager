//
//  Types.swift
//  TableManager
//
//  Created by Mario De Santis on 08/01/2018.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import Foundation
import UIKit


struct CellBuilder {
    var block: Blocks.cellBuilder
    var identifier: String?
    
    init(identifier: String, block: @escaping Blocks.cellBuilder) {
        self.block = block
        self.identifier = identifier
    }
    
    init(block: @escaping Blocks.cellBuilder) {
        self.block = block
    }
}


enum Blocks {
    typealias empty = () -> ()
    typealias string = (String) -> ()
    typealias cellBuilder = (UITableView, IndexPath) -> (UITableViewCell)
}


typealias DataSource = [[CellBuilder]]
