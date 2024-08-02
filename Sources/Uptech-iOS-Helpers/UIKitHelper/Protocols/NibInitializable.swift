//
//  NibInitializable.swift
//
//
//  Created by Sergey Kletsov on 28.03.2022.
//

import UIKit

/// Protocol that helps to initialize view with xib.
/// All properties and method have default implementation.
public protocol NibInitializable {
    /// Default implementation returns class name.
    static var nibName: String { get }
    /// Default implementation returns nib with self.nibName in default bundle.
    static var nib: UINib { get }
    /// Returns view initiated from xib
    /// - Returns: Default implementation returns first view in self.nib casted to Self.
    static func initFromNib() -> Self
}

public extension NibInitializable where Self: UIView {
    static var nibName: String {
        String(describing: Self.self)
    }

    static var nib: UINib {
        UINib(nibName: nibName, bundle: nil)
    }

    static func initFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("Could not instantiate view from nib with name \(nibName).")
        }

        return view
    }
}
