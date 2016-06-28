//
//  FieldersTableViewControllerTestCase.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 6/28/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import XCTest
@testable import Scorebook

class FieldersTableViewControllerTestCase: XCTestCase {
    
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: "FieldersTableViewController") as? FieldersTableViewController
    
    func testControllerExistsInStoryboard() {
        XCTAssertNotNil(controller)
    }
    
    func testSaveEmptyFielders() {
        selectRows([], andExpectFielders: [])
    }
    
    func testSaveFirstBaseman() {
        selectRows([2], andExpectFielders: [3])
    }
    
    func testDoublePlay() {
        selectRows([5, 3, 2], andExpectFielders: [6, 4, 3])
    }

    func selectRows(_ rows: [Int], andExpectFielders expectedFielders: [Int]) {
        let saveRecorded = expectation(withDescription: "saveBlockCalled")
        controller?.save = { fielders in
            XCTAssertEqual(fielders, expectedFielders)
            saveRecorded.fulfill()
        }
        
        for row in rows {
            let indexPath = IndexPath(row: row, section: 0)
            controller?.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
        controller?.saveButtonTapped(barButtonItem)
        
        waitForExpectations(withTimeout: 2.0, handler: nil)
    }
}
