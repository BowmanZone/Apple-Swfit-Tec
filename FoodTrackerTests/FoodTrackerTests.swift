//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by 钟 on 16/9/3.
//  Copyright © 2016年 Sean. All rights reserved.
//

import XCTest
@testable import FoodTracker

// Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
class FoodTrackerTests: XCTestCase {
    
    //MARK: FoodTracker Tests
    
    func testMealInitialization() {
        //通过测试几组数据，和你自己设计的是否是一样的效果
        //success
        let potentialItem = Meal.init(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
    
        //failed
        //no name
        let noName = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName)
        //bad rating
        let badRating = Meal.init(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive")
        
    }
    
}
