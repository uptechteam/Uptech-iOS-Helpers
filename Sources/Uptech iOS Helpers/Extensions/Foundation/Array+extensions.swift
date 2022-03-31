//
//  Array+extensions.swift
//  
//
//  Created by Sergey Kletsov on 25.03.2022.
//

import Foundation

public extension Array {
		/// Returns the element at the specified index if it is within bounds, otherwise nil.
		subscript(safe index: Index) -> Element? {
				indices.contains(index) ? self[index] : nil
		}
		
		/// Returns the elements at the specified range if it is within bounds, otherwise empty array.
		subscript(safe range: Range<Index>) -> [Element] {
				guard
						range.startIndex >= startIndex,
						range.endIndex <= endIndex else {
						return []
				}
				
				return Array(self[range])
		}
		
		/// Returns the elements at the specified closed range if it is within bounds, otherwise empty array.
		subscript(safe range: ClosedRange<Int>) -> [Element] {
				guard
						range.lowerBound >= 0,
						endIndex > 0,
						range.upperBound <= endIndex else {
						return []
				}
				
				let maxIndex = endIndex - 1
				let upperBound = Swift.min(range.upperBound, maxIndex)
				return Array(self[range.lowerBound...upperBound])
		}
}

public extension Array where Element: Equatable {
		/// Removes first element in array.
		/// - Parameter item: An element to remove.
		mutating func remove(_ item: Element) {
				guard let index = firstIndex(of: item) else { return }
				remove(at: index)
		}
		
		/// Returns next element in array after a given one.
		/// - Parameter item: An element to search next element.
		/// - Returns: Element after passed item. If passed item is last element in array will return nil.
		func next(item: Element) -> Element? {
				if let index = self.firstIndex(of: item) {
						return self[safe: index + 1]
				}
				return nil
		}
		
		/// Returns previous element in array before a given one.
		/// - Parameter item: An element to search previous element.
		/// - Returns: Element before passed item. If passed item is first element in array will return nil.
		func previous(item: Element) -> Element? {
				if let index = self.firstIndex(of: item) {
						return self[safe: index - 1]
				}
				return nil
		}
}
