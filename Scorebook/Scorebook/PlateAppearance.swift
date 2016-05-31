//
//  PlateAppearance.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 5/30/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import Foundation

enum PlateAppearanceOutcome {
    case Hit(numBases: Int)
    case Walk
    case HitByPitch
    case Error(fielder: Int)
    case FieldersChoice
    case DroppedThirdStrike
    case CatcherInterference
    case Strikeout(looking: Bool)
    case Groundout(fielders: [Int])
    case Lineout(fielder: Int)
    case Flyout(fielder: Int)
}

protocol PlateAppearanceDelegate {
    func plateAppearanceOutcomeDidChange(plateAppearance: PlateAppearance, outcome: PlateAppearanceOutcome?)
}

struct PlateAppearance {
    var balls = 0 {
        didSet {
            if balls >= 4 {
                outcome = .Walk
            }
        }
    }
    
    var strikes = 0 {
        didSet {
            if strikes >= 3 {
                outcome = .Strikeout(looking: true)
            }
        }
    }
    
    var outcome: PlateAppearanceOutcome? {
        didSet {
            delegate?.plateAppearanceOutcomeDidChange(self, outcome: outcome)
        }
    }
    var delegate: PlateAppearanceDelegate?
}