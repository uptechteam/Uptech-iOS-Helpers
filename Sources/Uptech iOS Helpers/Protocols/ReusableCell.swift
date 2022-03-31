//
//  ReusableCell.swift
//  
//
//  Created by Sergey Kletsov on 28.03.2022.
//

import UIKit

/// Protocol that helps with reusable cells. If used on UITableViewCell subclasses provides handy methods for registering and dequeueing cells in UITableView's
/// Has default implementation for reuseIdentifier.
public protocol ReusableCell {
		/// Default implementation return's class name
		static var reuseIdentifier: String { get }
}

public extension ReusableCell {
		static var reuseIdentifier: String {
				String(describing: Self.self)
		}
}

public extension UITableView {
		/// Dequeue's reusable cell for index path with given cell type.
		/// - Important: Will crash if cell type for given reuseIdentifier don't match passed cellType!
		/// - Parameters:
		///   - indexPath: The index path specifying the location of the cell.
		///   - cellType: Type of cell that should be dequeued. Must be ReusableCell.
		/// - Returns: UITableViewCell dequeued and cased to cellType.
		func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: ReusableCell {
				guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
						fatalError("Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self).")
				}
				
				return cell
		}
		
		/// Registers a class to use in creating new table cells by cellType.reuseIdentifier.
		/// - Parameter cellType: Cell type that will be registered by cellType.reuseIdentifier
		func register<T: UITableViewCell>(_ cellType: T.Type) where T: ReusableCell {
				self.register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
		}
		
		/// Registers a nib object that contains a cell with the table view under a specified identifier by cellType.reuseIdentifier.
		/// - Parameter cellType: Cell type, nib of witch will be registered by cellType.reuseIdentifier.
		func register<T: UITableViewCell>(_ cellType: T.Type) where T: ReusableCell & NibInitializable {
				self.register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
		}
}
