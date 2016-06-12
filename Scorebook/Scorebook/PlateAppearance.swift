//
//  PlateAppearance.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 5/30/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import Foundation

enum PlateAppearanceResult {
    case Single
    case Double
    case Triple
    case Homerun
    case Walk
    case HitByPitch
    case Error
    case FieldersChoice
    case DroppedThirdStrike
    case CatcherInterference
    case Strikeout
    case Groundout
    case Lineout
    case Flyout
}

struct PlateAppearanceOutcome {
    let result: PlateAppearanceResult
    let fielders: [Int]
    
    init(result: PlateAppearanceResult, fielders: [Int] = []) {
        self.result = result
        self.fielders = fielders
    }
    
    func outcomeByAddingFielder(fielder: Int) -> PlateAppearanceOutcome {
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