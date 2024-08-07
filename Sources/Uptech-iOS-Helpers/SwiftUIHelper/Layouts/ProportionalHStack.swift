//
//  ProportionalHStack.swift
//  
//
//  Created by Sergey Kletsov on 07.08.2024.
//

import SwiftUI

/// HStack layout that layouts subviews by given proportions
@available(iOS 16.0, *)
struct ProportionalHStack: Layout {
    let proportions: [CGFloat]
    let spacing: CGFloat

    /// Creates new layout with given proportions and spacing
    /// - Parameters:
    ///   - proportions: Array of proportions. Numbers in array should add up to **1.0**. Number of proportions should be equal to number of subviews.
    ///   - spacing: Spacing between subviews. Default value is 0
    init(proportions: [CGFloat], spacing: CGFloat = 0) {
        self.proportions = proportions
        self.spacing = spacing
    }

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout Void
    ) {
        guard subviews.count == proportions.count else {
            return
        }

        let totalWidth = bounds.width - (spacing * CGFloat(subviews.count - 1))
        var xOffset: CGFloat = bounds.minX

        for (index, subview) in subviews.enumerated() {
            let width = totalWidth * proportions[index]
            subview.place(
                at: CGPoint(x: xOffset, y: bounds.midY),
                anchor: .leading,
                proposal: ProposedViewSize(width: width, height: bounds.height)
            )
            xOffset += width + spacing
        }
    }
}
