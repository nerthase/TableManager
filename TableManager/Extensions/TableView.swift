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
}
