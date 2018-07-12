//
//  Array+SafeAccess.swift
//
//  Created by Piotr Gabryszak on 08.09.2016.
//  Copyright © 2016 Appchance. All rights reserved.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Iterator.Element? {
        return index >= startIndex && index < endIndex ? self[index] : nil
    }
}
