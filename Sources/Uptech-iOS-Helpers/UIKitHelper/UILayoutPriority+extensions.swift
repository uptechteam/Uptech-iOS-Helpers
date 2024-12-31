//
//  UILayoutPriority+extensions.swift
//  
//
//  Created by Sergey Kletsov on 25.03.2022.
//

import UIKit

public extension UILayoutPriority {
    /// rawValue 999
    static let almostRequired = UILayoutPriority(999)
    /// rawValue 751
    static let prioritizedCompressionResistance = UILayoutPriority(751)
    /// rawValue 251
    static let prioritizedHugging = UILayoutPriority(251)
}
