//
//  UIViewExtensions.swift
//  
//
//  Created by Sergey Kletsov on 25.03.2022.
//

import UIKit

// MARK: - Subview addition

public extension UIView {
    /// Adds a subview to self.
    /// Sets subview's `translatesAutoresizingMaskIntoConstraints` to `false` and activates given constraints array.
    /// - Parameters:
    ///   - view: The view to add as a subview and disable Autoresizing Mask.
    ///   - constraints: Constraints array to activate after adding subview and disabling Autoresizing Mask.
    func addSubview( _ view: UIView, withConstraints constraints: [NSLayoutConstraint]) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        constraints.activate()
    }

    /// Adds a subview to self.
    /// Sets subview's `translatesAutoresizingMaskIntoConstraints` to `false` and adds constraints to selfs edges.
    /// - Parameter view: The view to add as a subview and disable Autoresizing Mask.
    func addSubviewWithEdgeConstraints(_ view: UIView) {
        addSubview(view, withConstraints: [
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    /// Adds a subview to self.
    /// Sets subview's `translatesAutoresizingMaskIntoConstraints` to `false` and adds constraints to selfs `layoutMarginsGuide`.
    /// - Parameter view: The view to add as a subview and disable Autoresizing Mask.
    func addSubviewWithMarginEdgeConstraints(_ view: UIView) {
        addSubview(view, withConstraints: [
            view.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            view.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }

    /// Inserts a subview at the given index with given constraints.
    /// Also will set subview's `translatesAutoresizingMaskIntoConstraints` to `false`.
    /// - Parameters:
    ///   - view: The view to insert as a subview and disable Autoresizing Mask.
    ///   - index: The index in the array of the subviews property at which to insert the view. Defaults to `.zero`.
    ///   - constraints: Constraints array to activate after inserting subview and disabling Autoresizing Mask.
    func insertSubview(_ view: UIView, at index: Int = .zero, withConstraints constraints: [NSLayoutConstraint] ) {
        insertSubview(view, at: index)
        view.translatesAutoresizingMaskIntoConstraints = false
        constraints.activate()
    }

    /// Inserts a subview at the given index and adds constraints to selfs edges.
    /// Also will set subview's `translatesAutoresizingMaskIntoConstraints` to `false`.
    /// - Parameters:
    ///   - view: The view to insert as a subview and disable Autoresizing Mask.
    ///   - index: The index in the array of the subviews property at which to insert the view. Defaults to `.zero`.
    func insertSubviewWithEdgeConstraints(_ view: UIView, at index: Int = .zero) {
        insertSubview(view, at: index, withConstraints: [
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    /// Inserts a subview at the given index and adds constraints to selfs `layoutMarginsGuide`.
    /// Also will set subview's `translatesAutoresizingMaskIntoConstraints` to `false`.
    /// - Parameters:
    ///   - view: The view to insert as a subview and disable Autoresizing Mask.
    ///   - index: The index in the array of the subviews property at which to insert the view. Defaults to `.zero`.
    func insertSubviewWithMarginEdgeConstraints(_ view: UIView, at index: Int = .zero) {
        insertSubview(view, at: index, withConstraints: [
            view.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            view.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        ])
    }
}

// MARK: - Rounded corners

public extension UIView {
    /// Adds corner radius for given corners.
    /// - Parameters:
    ///   - radius: Corner radius to add.
    ///   - corners: Corners to add corner radius to. Defaults to `.all`.
    ///   - cornerCurve: The curve used for rendering the rounded corners of the layer. Defaults to `.circular`.
    func roundedCorners(radius: CGFloat, corners: CACornerMask = .all, cornerCurve: CALayerCornerCurve = .circular) {
        layer.maskedCorners = corners
        layer.cornerRadius = radius
        layer.cornerCurve = cornerCurve
    }
}
