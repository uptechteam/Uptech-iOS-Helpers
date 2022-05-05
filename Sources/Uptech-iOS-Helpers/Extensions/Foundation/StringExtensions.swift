//
//  StringExtensions.swift
//  
//
//  Created by Alexander Kulyk on 26.04.2022.
//

import Foundation

// MARK: - NSAttributedString creation

public extension String {
    /// The wrapper for a text message and an underlying `URL` to which the user will navigate upon tap.
    struct ClickableElement {
        let text: String
        let url: URL?

        /// Initializes a new clickable text element with the provided copy and link.
        /// - Parameters:
        ///   - text: Clickable text element body.
        ///   - url: The `URL` to which the user will navigate upon tap.
        init(
            text: String,
            url: URL?
        ) {
            self.text = text
            self.url = url
        }
    }

    /// Builds an attributed string from format string by replacing **\*** occurrences with clickable and **\*\*** with bold text elements.
    /// - Complexity: O(N) where N is a sum of clickable and bold elements.
    /// - Warning: If the number of placeholders exceeds the corresponding elements count - extra placeholders will be displayed as asterisks in the resulting string. Excessive elements will not be displayed if there are fewer placeholders than elements.
    /// - Parameters:
    ///   - format: Describes the format of a resulting attributed string. It contains **\*** and **\*\*** placeholders for clickable and bold elements.
    ///   - formatAttributes: Attributes applied to the whole **format** string.
    ///   - clickableElements: Elements replacing **\*** occurrences in the **format** string.
    ///   - clickableAttributes: Attributes applied to clickable elements. Values from **formatAttributes** will be used if no **clickableAttributes** values are provided.
    ///   - boldElements: Elements replacing **\*\*** occurrences in the **format** string.
    ///   - boldAttributes: Attributes applied to bold elements. Values from **formatAttributes** will be used if no **boldAttributes** values are provided.
    /// - Returns: New constructed instance of mutable attributed string.
    static func attributedString(
        format: String,
        formatAttributes: [NSAttributedString.Key: Any],
        clickableElements: [ClickableElement] = [],
        clickableAttributes: [NSAttributedString.Key: Any] = [:],
        boldElements: [String] = [],
        boldAttributes: [NSAttributedString.Key: Any] = [:]
    ) -> NSMutableAttributedString {
        let attributedFormat = NSMutableAttributedString(string: format, attributes: formatAttributes)

        for element in boldElements {
            attributedFormat.string.range(of: "**").map { foundRange in
                let range = NSRange(foundRange, in: attributedFormat.string)
                let attributedElement = NSAttributedString(
                    string: element,
                    attributes: boldAttributes.isEmpty ? formatAttributes : boldAttributes
                )
                attributedFormat.replaceCharacters(in: range, with: attributedElement)
            }
        }

        for element in clickableElements {
            attributedFormat.string.range(of: "*").map { foundRange in
                let range = NSRange(foundRange, in: attributedFormat.string)
                let linkAttributes = makeLinkAttributes(with: element.url, clickableAttributes: clickableAttributes)
                let attributedElement = NSAttributedString(string: element.text, attributes: linkAttributes)
                attributedFormat.replaceCharacters(in: range, with: attributedElement)
            }
        }

        return attributedFormat
    }

    private static func makeLinkAttributes(
        with url: URL?,
        clickableAttributes: [NSAttributedString.Key: Any]
    ) -> [NSAttributedString.Key: Any] {
        var attributes = clickableAttributes
        attributes[.link] = url
        return attributes
    }

    /// Build an attributed string with provided attributes from `self`.
    /// - Parameter attributes: Attributes applying to `self`.
    /// - Returns: Attributed string with provided attributes.
    func byAddingAttributes(_ attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        NSAttributedString(string: self, attributes: attributes)
    }
}
