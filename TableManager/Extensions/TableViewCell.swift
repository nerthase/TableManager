//
//  TableViewCell.swift
//  ProtocolApp
//
//  Created by Andrea & Beatrice on 02/01/18.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    class func identifier() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    class func nib() -> UINib {
        return UINib(nibName: self.identifier(), bundle: nil)
    }
    
}
