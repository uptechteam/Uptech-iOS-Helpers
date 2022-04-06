//
//  Array+extensionsTests.swift
//  
//
//  Created by Sergey Kletsov on 25.03.2022.
//

import XCTest
@testable import Uptech_iOS_Helpers

final class ArrayExtensionsTests: XCTestCase {
		private let sut = [0, 1, 2, 3, 4]
		
		func testSafeElementReturnsElement() throws {
				let result = sut[safe: 2]
				let expectedResult = 2
				XCTAssertEqual(result, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testSafeElementReturnsNil() throws {
				let result = sut[safe: 10]
				XCTAssertNil(result, "Result should be nil")
		}
		
		func testSafeRangeReturnsElements() throws {
				let result = sut[safe: 1..<3]
				let expectedResult = [1, 2]
				XCTAssertEqual(result, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testSafeNegativeRangeReturnsEmpty() throws {
				let result = sut[safe: -3..<(-1)]
				let expectedResult: [Int] = []
				XCTAssertEqual(result, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testSafeRangeReturnsEmpty() throws {
				let result = sut[safe: 7..<10]
				let expectedResult: [Int] = []
				XCTAssertEqual(result, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testSafeClosedRangeReturnsElements() throws {
				let result = sut[safe: 1...3]
				let expectedResult = [1, 2, 3]
				XCTAssertEqual(result, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testSafeNegativeClosedRangeReturnsEmpty() throws {
				let result = sut[safe: -3...(-1)]
				let expectedResult: [Int] = []
				XCTAssertEqual(result, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testSafeClosedRangeReturnsEmpty() throws {
				let result = sut[safe: 7...10]
				let expectedResult: [Int] = []
				XCTAssertEqual(result, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testRemoveExistingElement() throws {
				var sut = self.sut
				sut.remove(1)
				let expectedResult = [0, 2, 3, 4]
				XCTAssertEqual(sut, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testRemoveNonExistingElement() throws {
				var sut = self.sut
				sut.remove(5)
				let expectedResult = self.sut
				XCTAssertEqual(sut, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testNextElementExist() throws {
				let result = sut.next(item: 2)
				let expectedResult = 3
				XCTAssertEqual(result, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testNextElementNil() throws {
				let result = sut.next(item: 4)
				XCTAssertNil(result, "Result should be nil")
		}
		
		func testPreviousElementExist() throws {
				let result = sut.previous(item: 2)
				let expectedResult = 1
				XCTAssertEqual(result, expectedResult, "Result should be \(expectedResult)")
		}
		
		func testPreviousElementNil() throws {
				let result = sut.previous(item: 0)
				XCTAssertNil(result, "Result should be nil")
		}
}
