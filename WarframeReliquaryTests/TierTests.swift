//
//  TierTests.swift
//  WarframeReliquary
//
//  Created by Anthony Whitaker on 10/14/16.
//  Copyright © 2016 Anthony Whitaker. All rights reserved.
//

import XCTest
@testable import WarframeReliquary

class TierTests: XCTestCase {
    
    func testCases() {
        // Test values composition
        XCTAssertTrue(Tier.values.contains(.Lith))
        XCTAssertTrue(Tier.values.contains(.Meso))
        XCTAssertTrue(Tier.values.contains(.Neo))
        XCTAssertTrue(Tier.values.contains(.Axi))

        XCTAssertEqual(4, Tier.values.count) // Test for additional values
        
        let tier = Tier.Lith // Test for additional cases
        switch tier {
        case .Lith: break
        case .Meso: break
        case .Neo: break
        case .Axi: break
        default: assertionFailure("This should never happen.")
        }
        
    }
    
}
