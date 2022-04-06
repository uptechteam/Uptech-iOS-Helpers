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
