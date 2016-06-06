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
        assertStringEquivalentTo("1B", outcome: PlateAppearanceOutcome(result: .Single))
    }
    
    func testDouble() {
        assertStringEquivalentTo("2B", outcome: PlateAppearanceOutcome(result: .Double))
    }
    
    func testTriple() {
        assertStringEquivalentTo("3B", outcome: PlateAppearanceOutcome(result: .Triple))
    }
    
    func testHomeRun() {
        assertStringEquivalentTo("HR", outcome: PlateAppearanceOutcome(result: .Homerun))
    }
    
    func testWalk() {
        assertStringEquivalentTo("BB", outcome: PlateAppearanceOutcome(result: .Walk))
    }
    
    func testHitByPitch() {
        assertStringEquivalentTo("HBP", outcome: PlateAppearanceOutcome(result: .HitByPitch))
    }
    
    func testError() {
        assertStringEquivalentTo("E-4", outcome: PlateAppearanceOutcome(result: .Error, fielders: [4]))
        assertStringEquivalentTo("E-7", outcome: PlateAppearanceOutcome(result: .Error, fielders: [7]))
    }
    
    func testFieldersChoice() {
        assertStringEquivalentTo("FC-6-4", outcome: PlateAppearanceOutcome(result: .FieldersChoice, fielders: [6, 4]))
        assertStringEquivalentTo("FC-5-4", outcome: PlateAppearanceOutcome(result: .FieldersChoice, fielders: [5, 4]))
    }
    
    func testDroppedThirdStrike() {
        assertStringEquivalentTo("K WP", outcome: PlateAppearanceOutcome(result: .DroppedThirdStrike))
    }
    
    func testCatcherInterference() {
        assertStringEquivalentTo("I", outcome: PlateAppearanceOutcome(result: .CatcherInterference))
    }
    
    func testStrikeout() {
        assertStringEquivalentTo("K", outcome: PlateAppearanceOutcome(result: .Strikeout))
    }
    
    func testGroundout() {
        assertStringEquivalentTo("GO-5-3", outcome: PlateAppearanceOutcome(result: .Groundout, fielders: [5, 3]))
        assertStringEquivalentTo("GO-6-3", outcome: PlateAppearanceOutcome(result: .Groundout, fielders: [6, 3]))
    }
    
    func testLineout() {
        assertStringEquivalentTo("LO-7", outcome: PlateAppearanceOutcome(result: .Lineout, fielders: [7]))
        assertStringEquivalentTo("LO-4", outcome: PlateAppearanceOutcome(result: .Lineout, fielders: [4]))
    }
    
    func testFlyout() {
        assertStringEquivalentTo("FO-8", outcome: PlateAppearanceOutcome(result: .Flyout, fielders: [8]))
        assertStringEquivalentTo("FO-9", outcome: PlateAppearanceOutcome(result: .Flyout, fielders: [9]))
    }
    
    func assertStringEquivalentTo(string: String, outcome: PlateAppearanceOutcome) {
        XCTAssertEqual(formatter.stringFromOutcome(outcome), string)
        
        if let actualOutcome = formatter.outcomeFromString(string) {
            XCTAssertEqual(actualOutcome, outcome)
        } else {
            XCTFail()
        }
    }
}
