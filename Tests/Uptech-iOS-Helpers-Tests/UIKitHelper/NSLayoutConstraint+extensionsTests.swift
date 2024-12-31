//
//  NSLayoutConstraint+extensionsTests.swift
//  
//
//  Created by Sergey Kletsov on 29.03.2022.
//

import XCTest
@testable import UptechUIKitHelper

final class NSLayoutConstraintExtensionsTests: XCTestCase {
    
    func testWithPriority() throws {
        let sut = NSLayoutConstraint()
        let priority = UILayoutPriority.almostRequired
        let result = sut.withPriority(priority)
        XCTAssertEqual(result.priority, priority, "sut's priority should be \(priority)")
    }
    
    func testActivateExtension() throws {
        let rootView = UIView()
        let subview = UIView()
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        rootView.addSubview(subview)
        
        let sut = [subview.heightAnchor.constraint(equalToConstant: 100),
                   subview.widthAnchor.constraint(equalTo: rootView.widthAnchor),
                   subview.centerYAnchor.constraint(equalTo: rootView.centerYAnchor),
                   subview.centerXAnchor.constraint(equalTo: rootView.centerXAnchor)]
        
        sut.activate()
        XCTAssertTrue(sut.allSatisfy(\.isActive), "all constrains in sut array should be activated")
    }
    
}
