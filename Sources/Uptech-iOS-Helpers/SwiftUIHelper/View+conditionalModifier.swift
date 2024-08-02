//
//  View+conditionalModifier.swift
//
//
//  Created by Sergey Kletsov on 02.08.2024.
//

import SwiftUI

public extension View {
    typealias ContentTransform<Content: View> = (Self) -> Content

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

    @ViewBuilder
    func modify<Content: View>(
        @ViewBuilder content: ContentTransform<Content>
    ) -> some View {
        content(self)
    }
}
