//
//  Strings.swift
//  ProtocolApp
//
//  Created by Andrea & Beatrice on 02/01/18.
//  Copyright © 2018 Fuoricittà S.r.l.s. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func replace(_ range: NSRange, string: String) -> String {
        return (self as NSString).replacingCharacters(in: range, with: string)
    }
    
}
