//
//  UICollectionView+extensions.swift
//
//
//  Created by Sergey Kletsov on 05.04.2022.
//

import UIKit

public extension UICollectionView {
    /// Dequeue's reusable cell for index path with given cell type.
    /// - Important: Will crash if cell type for given reuseIdentifier don't match passed cellType!
    /// - Parameters:
    ///   - indexPath: The index path specifying the location of the cell.
    ///   - cellType: Type of cell that should be dequeued. Must be ReusableCell.
    /// - Returns: UICollectionViewCell dequeued and cased to cellType.
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: ReusableCell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self).")
        }

        return cell
    }

    /// Registers a class to use in creating new table cells by cellType.reuseIdentifier.
    /// - Parameter cellType: Cell type that will be registered by cellType.reuseIdentifier
    func register<T: UICollectionViewCell>(_ cellType: T.Type) where T: ReusableCell {
        self.register(cellType.self, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    /// Registers a nib object that contains a cell with the table view under a specified identifier by cellType.reuseIdentifier.
    /// - Parameter cellType: Cell type, nib of witch will be registered by cellType.reuseIdentifier.
    func register<T: UICollectionViewCell>(_ cellType: T.Type) where T: ReusableCell & NibInitializable {
        self.register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
}
