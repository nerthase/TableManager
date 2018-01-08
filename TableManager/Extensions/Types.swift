//
//  Types.swift
//  TableManager
//
//  Created by Mario De Santis on 08/01/2018.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import Foundation
import UIKit


enum Blocks {
    typealias empty = () -> ()
    typealias string = (String) -> ()
    typealias cellBuilder = (UITableView, IndexPath) -> (UITableViewCell)
}

enum Tuples {
    typealias cellBuilder = (identifier: String?, block: Blocks.cellBuilder)
}

typealias DataSource = [[Tuples.cellBuilder]]
