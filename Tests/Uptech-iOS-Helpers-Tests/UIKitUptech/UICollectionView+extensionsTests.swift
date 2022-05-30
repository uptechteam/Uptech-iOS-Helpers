//
//  UICollectionView+extensionsTests.swift
//  
//
//  Created by Sergey Kletsov on 05.04.2022.
//

import XCTest
import UIKit
@testable import UIKitUptech

final class UICollectionViewExtensionsTests: XCTestCase {
		private class TestCell: UICollectionViewCell, ReusableCell { }
		private let cellType = TestCell.self
		
		func testRegisterCorrectType() throws {
				let collectionView = createCollectionView()
				collectionView.register(cellType)
				let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: .init(item: 0, section: 0))
				let isCellRightType = cell.isKind(of: cellType)
				XCTAssertTrue(isCellRightType, "dequeued cell must be \(cellType)")
		}
		
		func testDequeueNotCrashing() {
				let collectionView = createCollectionView()
				collectionView.register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
				let _ = collectionView.dequeueReusableCell(for: .init(item: 0, section: 0), cellType: cellType)
		}
		
		private func createCollectionView() -> UICollectionView {
				UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
		}
}
