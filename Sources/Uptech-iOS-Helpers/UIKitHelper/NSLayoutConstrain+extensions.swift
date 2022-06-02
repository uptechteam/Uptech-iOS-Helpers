//
//  NSLayoutConstrain+extensions.swift
//  
//
//  Created by Sergey Kletsov on 25.03.2022.
//

import UIKit

public extension NSLayoutConstraint {
		@discardableResult
		/// Returns self with given priority.
		/// - Parameter priority: UILayoutPriority to set.
		/// - Returns: self.
		func withPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
				self.priority = priority
				return self
		}
}

public extension Array where Element == NSLayoutConstraint {
		/// Activates each constraint in self
		func activate() {
				NSLayoutConstraint.activate(self)
		}
}
