//
//  UIView+extensions.swift
//
//
//  Created by Sergey Kletsov on 25.03.2022.
//
import UIKit

public extension UIView {
    /// Adds a view as subview the self.
    /// Set's view translatesAutoresizingMaskIntoConstraints to false.
    /// Activates given constrains array.
    /// - Parameters:
    ///   - view: View to add as subview and disable Autoresizing Mask.
    ///   - constraints: Constrains array to activate after adding subview and disabling Autoresizing Mask.
    func addSubview( _ view: UIView, withConstraints constraints: [NSLayoutConstraint]) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        constraints.activate()
    }

    /// Adds a view as subview the self.
    /// Adds constrains that fill given view to self's bounds.
    /// - Also will set given view's translatesAutoresizingMaskIntoConstraints to false.
    /// - Parameter view: View to add as subview and fill to self's bounds.
    func addSubviewWithEdgeConstraints(_ view: UIView) {
        addSubview(view, withConstraints: [
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    /// Inserts a view to self at given index with given constrains.
    /// - Also will set given view's translatesAutoresizingMaskIntoConstraints to false.
    /// - Parameters:
    ///   - view: View to insert as subview and disable Autoresizing Mask.
    ///   - index: The index in the array of the subviews property at which to insert the view. Default value .zero
    ///   - constraints: Constrains array to activate after adding subview and disabling Autoresizing Mask.
    func insertSubview(_ view: UIView, at index: Int = .zero, withConstraints constraints: [NSLayoutConstraint] ) {
        insertSubview(view, at: index)
        view.translatesAutoresizingMaskIntoConstraints = false
        constraints.activate()
    }

    /// Inserts a view as subview the self.
    /// Adds constrains that fill given view to self's bounds.
    /// - Also will set given view's translatesAutoresizingMaskIntoConstraints to false.
    /// - Parameters:
    ///   - view: View to insert as subview and fill to self's bounds.
    ///   - index: The index in the array of the subviews property at which to insert the view. Default value .zero
    func insertSubviewWithEdgeConstraints(_ view: UIView, at index: Int = .zero) {
        insertSubview(view, at: index, withConstraints: [
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    /// Adds corner radius to given corners.
    /// - Parameters:
    ///   - radius: Corner radius to add.
    ///   - corners: Corners to add corner radius to. Default value .all
    func roundCornersContinuously(radius: CGFloat, corners: CACornerMask = .all) {
        layer.maskedCorners = corners
        layer.cornerRadius = radius

        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
    }
}
