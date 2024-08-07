//
//  ProportionalVStack.swift
//
//
//  Created by Sergey Kletsov on 07.08.2024.
//

import SwiftUI

/// VStack layout that layouts subviews by given proportions
@available(iOS 16.0, *)
public struct ProportionalVStack: Layout {
    private let proportions: [CGFloat]
    private let spacing: CGFloat

    /// Creates new layout with given proportions and spacing
    /// - Parameters:
    ///   - proportions: Array of proportions. Numbers in array should add up to **1.0**. Number of proportions should be equal to number of subviews.
    ///   - spacing: Spacing between subviews. Default value is 0
    init(proportions: [CGFloat], spacing: CGFloat = 0) {
        self.proportions = proportions
        self.spacing = spacing
    }

    public func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }

    public func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) {
        guard subviews.count == proportions.count else {
            return
        }

        let totalHeight = bounds.height - (spacing * CGFloat(subviews.count - 1))
        var yOffset: CGFloat = bounds.minY

        for (index, subview) in subviews.enumerated() {
            let height = totalHeight * proportions[index]
            subview.place(
                at: CGPoint(x: bounds.midX, y: yOffset),
                anchor: .top,
                proposal: ProposedViewSize(width: bounds.width, height: height)
            )
            yOffset += height + spacing
        }
    }
}
