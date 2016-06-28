//
//  PlateAppearanceOutcomeFormatter.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 5/31/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import Foundation

class PlateAppearanceOutcomeFormatter {
    
    private let outcomeToPrefix = [PlateAppearanceResult.single: "1B",
                                   .double: "2B",
                                   .triple: "3B",
                                   .homerun: "HR",
                                   .walk: "BB",
                                   .hitByPitch: "HBP",
                                   .error: "E",
                                   .fieldersChoice: "FC",
                                   .droppedThirdStrike: "K WP",
                                   .catcherInterference: "I",
                                   .strikeout: "K",
                                   .groundout: "GO",
                                   .lineout: "LO",
                                   .flyout: "FO"]
    
    func stringFromOutcome(_ outcome: PlateAppearanceOutcome) -> String {
        if let prefix = outcomeToPrefix[outcome.result] {
            return stringWithPrefix(prefix, fielders: outcome.fielders)
        } else {
            return ""
        }
    }
    
    func outcomeFromString(_ string: String) -> PlateAppearanceOutcome? {
        let components = string.components(separatedBy: "-")
        guard let stringPrefix = components.first else { return nil }
        
        for (result, prefix) in outcomeToPrefix {
            if stringPrefix == prefix {
                return PlateAppearanceOutcome(result: result, fielders:fieldersFromString(string))
            }
        }
        
        return nil
    }
    
    private func stringWithPrefix(_ prefix: String, fielders: [Int]) -> String {
        return fielders.isEmpty ? prefix : prefix + "-" + fielders.map({ String($0) }).joined(separator: "-")
    }
    
    private func fieldersFromString(_ string: String) -> [Int] {
        var fielderStrings = string.components(separatedBy: "-")
        fielderStrings.removeFirst()
        return fielderStrings.map({ Int($0)! })
    }
}
