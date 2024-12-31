//
//  View+customOnChange.swift
//
//
//  Created by Sergey Kletsov on 02.08.2024.
//

import SwiftUI

public extension View {
    /// Adds a modifier for this view that fires an action when a specific value changes.
    /// Calls different methods depending of iOS version (new system onChange modifier was introduced in iOS 17)
    /// - Parameters:
    ///   - value: The value to check against when determining whether to run the closure.
    ///   - initial: Whether the action should be run when this view initially appears. (will be used only on iOS 17)
    ///   - action: A closure to run when the value changes. Will use newValue on iOS 17
    /// - Returns: A view that fires an action when the specified value changes.
    @available(iOS 14.0, *)
    @ViewBuilder
    func customOnChange<V>(
        of value: V,
        initial: Bool = false,
        _ action: @escaping (V) -> Void
    ) -> some View where V: Equatable {
        if #available(iOS 17.0, *) {
            self.onChange(of: value, initial: initial, { _, newValue in action(newValue) })
        } else {
            self.onChange(of: value, perform: action)
        }
    }
}
