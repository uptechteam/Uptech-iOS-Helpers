//
//  CACornerMaskExtensions.swift
//  
//
//  Created by Sergey Kletsov on 25.03.2022.
//

import UIKit

public extension CACornerMask {
    /// Contains all 4 corner masks: `layerMinXMinYCorner`, `layerMaxXMinYCorner`, `layerMinXMaxYCorner` and `layerMaxXMaxYCorner`.
    static let all: CACornerMask = [
        .layerMinXMinYCorner,
        .layerMaxXMinYCorner,
        .layerMinXMaxYCorner,
        .layerMaxXMaxYCorner
    ]
}
