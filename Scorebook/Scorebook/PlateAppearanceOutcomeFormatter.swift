//
//  PlateAppearanceOutcomeFormatter.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 5/31/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import Foundation

class PlateAppearanceOutcomeFormatter {
    
    private let outcomeToPrefix = [PlateAppearanceResult.Single: "1B",
                                   .Double: "2B",
                                   .Triple: "3B",
                                   .Homerun: "HR",
                                   .Walk: "BB",
                                   .HitByPitch: "HBP",
                                   .Error: "E",
                                   .FieldersChoice: "FC",
                                   .DroppedThirdStrike: "K WP",
                                   .CatcherInterference: "I",
                                   .Strikeout: "K",
                                   .Groundout: "GO",
                                   .Lineout: "LO",
                                   .Flyout: "FO"]
    
    func stringFromOutcome(outcome: PlateAppearanceOutcome) -> String {
        if let prefix = outcomeToPrefix[outcome.result] {
            return stringWithPrefix(prefix, fielders: outcome.fielders)
        } else {
            return ""
        }
    }
    
    func outcomeFromString(string: String) -> PlateAppearanceOutcome? {
        let components = string.componentsSeparatedByString("-")
        guard let stringPrefix = components.first else { return nil }
        
        for (result, prefix) in outcomeToPrefix {
            if stringPrefix == prefix {
                return PlateAppearanceOutcome(result: result, fielders:fieldersFromString(string))
            }
        }
        
        return nil
    }
    
    private func stringWithPrefix(prefix: String, fielders: [Int]) -> String {
        return fielders.isEmpty ? prefix : prefix + "-" + fielders.map({ String($0) }).joinWithSeparator("-")
    }
    
    private func fieldersFromString(string: String) -> [Int] {
        var fielderStrings = string.componentsSeparatedByString("-")
        fielderStrings.removeFirst()
        return fielderStrings.map({ Int($0)! })
    }
}