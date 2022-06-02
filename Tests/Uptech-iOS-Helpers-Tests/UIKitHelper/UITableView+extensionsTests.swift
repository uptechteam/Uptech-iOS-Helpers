//
//  UITableView+extensionsTests.swift
//  
//
//  Created by Sergey Kletsov on 05.04.2022.
//

import XCTest
import UIKit
@testable import UIKitHelper

final class UITableViewExtensionsTests: XCTestCase {
		private class TestCell: UITableViewCell, ReusableCell { }
		private let cellType = TestCell.self
		
		func testRegisterCorrectType() throws {
				let tableView = UITableView()
				tableView.register(cellType)
				let cell = tableView.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: .init(item: 0, section: 0))
				let isCellRightType = cell.isKind(of: cellType)
				XCTAssertTrue(isCellRightType, "dequeued cell must be \(cellType)")
		}
		
		func testDequeueNotCrashing() {
				let tableView = UITableView()
				tableView.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
				let _ = tableView.dequeueReusableCell(for: .init(item: 0, section: 0), cellType: cellType)
		}
}
