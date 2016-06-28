//
//  PlateAppearanceOutcomeFormatterTestCase.swift
//  PlateAppearanceOutcomeFormatterTestCase
//
//  Created by Jonathan Arbogast on 5/30/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import XCTest
@testable import Scorebook

class PlateAppearanceOutcomeFormatterTestCase: XCTestCase {
    
    let formatter = PlateAppearanceOutcomeFormatter()
    
    func testSingle() {
        assertStringEquivalentTo("1B", outcome: PlateAppearanceOutcome(result: .single))
    }
    
    func testDouble() {
        assertStringEquivalentTo("2B", outcome: PlateAppearanceOutcome(result: .double))
    }
    
    func testTriple() {
        assertStringEquivalentTo("3B", outcome: PlateAppearanceOutcome(result: .triple))
    }
    
    func testHomeRun() {
        assertStringEquivalentTo("HR", outcome: PlateAppearanceOutcome(result: .homerun))
    }
    
    func testWalk() {
        assertStringEquivalentTo("BB", outcome: PlateAppearanceOutcome(result: .walk))
    }
    
    func testHitByPitch() {
        assertStringEquivalentTo("HBP", outcome: PlateAppearanceOutcome(result: .hitByPitch))
    }
    
    func testError() {
        assertStringEquivalentTo("E-4", outcome: PlateAppearanceOutcome(result: .error, fielders: [4]))
        assertStringEquivalentTo("E-7", outcome: PlateAppearanceOutcome(result: .error, fielders: [7]))
    }
    
    func testFieldersChoice() {
        assertStringEquivalentTo("FC-6-4", outcome: PlateAppearanceOutcome(result: .fieldersChoice, fielders: [6, 4]))
        assertStringEquivalentTo("FC-5-4", outcome: PlateAppearanceOutcome(result: .fieldersChoice, fielders: [5, 4]))
    }
    
    func testDroppedThirdStrike() {
        assertStringEquivalentTo("K WP", outcome: PlateAppearanceOutcome(result: .droppedThirdStrike))
    }
    
    func testCatcherInterference() {
        assertStringEquivalentTo("I", outcome: PlateAppearanceOutcome(result: .catcherInterference))
    }
    
    func testStrikeout() {
        assertStringEquivalentTo("K", outcome: PlateAppearanceOutcome(result: .strikeout))
    }
    
    func testGroundout() {
        assertStringEquivalentTo("GO-5-3", outcome: PlateAppearanceOutcome(result: .groundout, fielders: [5, 3]))
        assertStringEquivalentTo("GO-6-3", outcome: PlateAppearanceOutcome(result: .groundout, fielders: [6, 3]))
    }
    
    func testLineout() {
        assertStringEquivalentTo("LO-7", outcome: PlateAppearanceOutcome(result: .lineout, fielders: [7]))
        assertStringEquivalentTo("LO-4", outcome: PlateAppearanceOutcome(result: .lineout, fielders: [4]))
    }
    
    func testFlyout() {
        assertStringEquivalentTo("FO-8", outcome: PlateAppearanceOutcome(result: .flyout, fielders: [8]))
        assertStringEquivalentTo("FO-9", outcome: PlateAppearanceOutcome(result: .flyout, fielders: [9]))
    }
    
    func assertStringEquivalentTo(_ string: String, outcome: PlateAppearanceOutcome) {
        XCTAssertEqual(formatter.stringFromOutcome(outcome), string)
        
        if let actualOutcome = formatter.outcomeFromString(string) {
            XCTAssertEqual(actualOutcome, outcome)
        } else {
            XCTFail()
        }
    }
}
