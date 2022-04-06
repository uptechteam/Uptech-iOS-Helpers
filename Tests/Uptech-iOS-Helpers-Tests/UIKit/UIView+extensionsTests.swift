//
//  UIView+extensionsTests.swift
//  
//
//  Created by Sergey Kletsov on 29.03.2022.
//

import XCTest
@testable import Uptech_iOS_Helpers

final class UIViewExtensionsTests: XCTestCase {
		
		func testSubviewAdding() throws {
				let view = UIView()
				let sut = UIView()
				let constrains = [sut.heightAnchor.constraint(equalToConstant: 10),
													sut.widthAnchor.constraint(equalTo: view.widthAnchor),
													sut.centerYAnchor.constraint(equalTo: view.centerYAnchor)]
				
				view.addSubview(sut, withConstraints: constrains)
				
				XCTAssertTrue(view.subviews.contains(sut), "view should contain sut")
				XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "sut's translatesAutoresizingMaskIntoConstraints should be false")
				XCTAssertTrue(constrains.allSatisfy(\.isActive), "all constrains should be active")
		}
		
		func testSubviewWithEdgeConstraintsAdding() throws {
				let frame = CGRect(origin: .zero, size: .init(width: 10, height: 10))
				let view = UIView(frame: frame)
				let sut = UIView()
				
				view.addSubviewWithEdgeConstraints(sut)
				sut.layoutIfNeeded()
				
				XCTAssertEqual(frame, sut.bounds, "sut's bounds should be equal to view's bounds")
		}
		
		func testSubviewInserting() throws {
				let view = UIView()
				let subview1 = UIView()
				let subview2 = UIView()
				view.addSubview(subview1)
				view.addSubview(subview2)
				
				let sut = UIView()
				let constrains = [sut.heightAnchor.constraint(equalToConstant: 10),
													sut.widthAnchor.constraint(equalTo: view.widthAnchor),
													sut.centerYAnchor.constraint(equalTo: view.centerYAnchor)]
				let index = 1
				view.insertSubview(sut, at: index, withConstraints: constrains)
				
				XCTAssertEqual(view.subviews.firstIndex(of: sut), index, "sut's index should be \(index)")
				XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints, "sut's translatesAutoresizingMaskIntoConstraints should be false")
				XCTAssertTrue(constrains.allSatisfy(\.isActive), "all constrains should be active")
		}
		
		func testSubviewWithEdgeConstraintsInserting() throws {
				let frame = CGRect(origin: .zero, size: .init(width: 10, height: 10))
				let view = UIView(frame: frame)
				let subview1 = UIView()
				let subview2 = UIView()
				view.addSubview(subview1)
				view.addSubview(subview2)
				
				let sut = UIView()
				let index = 1
				view.insertSubviewWithEdgeConstraints(sut, at: index)
				sut.layoutIfNeeded()
				
				XCTAssertEqual(view.subviews.firstIndex(of: sut), index, "sut's index should be \(index)")
				XCTAssertEqual(frame, sut.bounds, "sut's bounds should be equal to view's bounds")
		}

}
