//
//  View+conditionalModifier.swift
//
//
//  Created by Sergey Kletsov on 02.08.2024.
//

import SwiftUI

public extension View {
    typealias ContentTransform<Content: View> = (Self) -> Content

    /// Conditional Modifier method that modifies view depending of input Bool
    /// - Parameters:
    ///   - condition: Bool condition to check
    ///   - ifTrue: Modifier closure that will be applied if condition is true
    ///   - ifFalse: Modifier closure that will be applied if condition is false
    /// - Returns: Self modified by ifTrue or ifFalse closure
    @ViewBuilder
    func conditionalModifier<TrueContent: View, FalseContent: View>(
        _ condition: @autoclosure () -> Bool,
        ifTrue: ContentTransform<TrueContent>,
        else ifFalse: ContentTransform<FalseContent>
    ) -> some View {
        if condition() {
            ifTrue(self)
        } else {
            ifFalse(self)
        }
    }

    /// Conditional Modifier method that modifies view depending of input Bool
    /// - Parameters:
    ///   - condition: Bool condition to check
    ///   - ifTrue: Modifier closure that will be applied if condition is true
    ///   - ifFalse: Modifier closure that will be applied if condition is false
    /// - Returns: Self modified by ifTrue or ifFalse closure

    /// Conditional Modifier method that modifies view depending of input Bool
    /// - Parameters:
    ///   - condition: Bool condition to check
    ///   - transform: Modifier closure that will be applied if condition is true
    /// - Returns: Self modified by ifTrue closure if condition is true, Self otherwise
    @ViewBuilder
    func `if`<Content: View>(
        _ condition: @autoclosure () -> Bool,
        transform: ContentTransform<Content>
    ) -> some View {
        conditionalModifier(
            condition(),
            ifTrue: transform,
            else: { $0 }
        )
    }

    /// Modifier method that modifies view
    /// - Parameter transform: Modifier closure to apply
    /// - Returns: Self modified by transform closure
    @ViewBuilder
    func modify<Content: View>(
        @ViewBuilder transform: ContentTransform<Content>
    ) -> some View {
        transform(self)
    }
}
