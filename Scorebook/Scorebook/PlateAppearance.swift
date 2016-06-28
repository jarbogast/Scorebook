//
//  PlateAppearance.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 5/30/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import Foundation

enum PlateAppearanceResult {
    case single
    case double
    case triple
    case homerun
    case walk
    case hitByPitch
    case error
    case fieldersChoice
    case droppedThirdStrike
    case catcherInterference
    case strikeout
    case groundout
    case lineout
    case flyout
}

struct PlateAppearanceOutcome {
    let result: PlateAppearanceResult
    let fielders: [Int]
    
    init(result: PlateAppearanceResult, fielders: [Int] = []) {
        self.result = result
        self.fielders = fielders
    }
    
    func outcomeByAddingFielder(_ fielder: Int) -> PlateAppearanceOutcome {
        return PlateAppearanceOutcome(result: result, fielders: fielders + [fielder])
    }
}

extension PlateAppearanceOutcome: Equatable { }

func ==(lhs: PlateAppearanceOutcome, rhs: PlateAppearanceOutcome) -> Bool {
    return lhs.result == rhs.result && lhs.fielders == rhs.fielders
}

struct PlateAppearance {
    let outcome: PlateAppearanceOutcome
}
