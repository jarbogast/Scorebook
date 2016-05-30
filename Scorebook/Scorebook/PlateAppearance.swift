//
//  PlateAppearance.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 5/30/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import Foundation

struct PlateAppearance {
    var balls = 0
    var strikes = 0
    var outcome: PlateAppearanceOutcome?
    
    enum PlateAppearanceOutcome {
        case Walk
        case Strikeout
        case Hit
    }
}