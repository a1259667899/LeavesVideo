//
//  LVMineCollectionTest.swift
//  LeavesVideoTests
//
//  Created by Sinder on 2018/11/9.
//  Copyright © 2018 Sinder. All rights reserved.
//

import XCTest

class LVMineCollectionTest: XCTestCase {
    let dataController : LVMineCollectionTableViewDataController?
    override func setUp() {
        dataController = LVMineCollectionTableViewDataController()
    }

    override func tearDown() {
        dataController = nil
    }

    func testLoad() {
        dataController?.requestFirstPage(successCallBack: {
            
        }, failCallBack: {
            
        })
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
