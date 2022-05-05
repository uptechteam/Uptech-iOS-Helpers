//
//  UITextViewExtensions.swift
//  
//
//  Created by Alexander Kulyk on 05.05.2022.
//

import UIKit

public extension UITextView {
    /// Sets `textContainerInset` and `textContainer.lineFragmentPadding` to `.zero`
    func removeInternalPadding() {
        textContainerInset = .zero
        textContainer.lineFragmentPadding = .zero
    }

    /// Sets provided color for `.foregroundColor` key in `linkTextAttributes`.
    /// - Parameter foregroundColor: The color to apply to links.
    func setLinkAttributes(foregroundColor: UIColor) {
        linkTextAttributes = [.foregroundColor: foregroundColor]
    }
}
