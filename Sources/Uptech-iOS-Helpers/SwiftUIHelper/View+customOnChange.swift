//
//  View+customOnChange.swift
//
//
//  Created by Sergey Kletsov on 02.08.2024.
//

import SwiftUI

public extension View {
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
