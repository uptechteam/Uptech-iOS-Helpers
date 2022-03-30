//
//  File.swift
//  
//
//  Created by Sergey Kletsov on 25.03.2022.
//

import UIKit

public extension CACornerMask {
		/// Contains all corner masks (MaxXMaxY, MinXMaxY, MaxXMinY, MinXMinY).
		static let all: CACornerMask = [
				CACornerMask.layerMaxXMaxYCorner,
				CACornerMask.layerMinXMaxYCorner,
				CACornerMask.layerMaxXMinYCorner,
				CACornerMask.layerMinXMinYCorner
		]
}
