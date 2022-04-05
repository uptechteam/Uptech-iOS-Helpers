//
//  Collection+indexPath Tests.swift
//  
//
//  Created by Sergey Kletsov on 29.03.2022.
//

import XCTest
@testable import Uptech_iOS_Helpers

final class CollectionIndexPathTests: XCTestCase {
		private let sut = [[0, 1, 2],
											 [3, 4, 5],
											 [6, 7, 8]]
		
		func testIndexPathSubscriptFirstItem() {
				let result = sut[IndexPath(item: 0, section: 0)]
				let expectedResult = 0
				
				XCTAssertEqual(result, expectedResult)
		}
		
		func testIndexPathSubscriptMiddleItem() {
				let result = sut[IndexPath(row: 1, section: 1)]
				let expectedResult = 4
				
				XCTAssertEqual(result, expectedResult)
		}
		
		func testIndexPathSubscriptLastItem() {
				let result = sut[IndexPath(item: 2, section: 2)]
				let expectedResult = 8
				
				XCTAssertEqual(result, expectedResult)
		}
		
}
