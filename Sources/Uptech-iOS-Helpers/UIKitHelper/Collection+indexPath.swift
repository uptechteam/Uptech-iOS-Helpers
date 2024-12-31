//
//  Collection+indexPath.swift
//
//
//  Created by Sergey Kletsov on 25.03.2022.
//

import UIKit

public extension Collection where Index == Int, Iterator.Element: Collection, Iterator.Element.Index == Int {
    /// Returns Element in two dimensional array by IndexPath.
    /// - Parameter indexPath: An IndexPath to get Element by section and row.
    /// - Returns: Element by given indexPath.
    subscript(indexPath: IndexPath) -> Iterator.Element.Iterator.Element {
        self[indexPath.section][indexPath.row]
    }
}
