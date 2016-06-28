//
//  ViewController.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 5/30/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import UIKit

class PlateAppearanceViewController: UIViewController {
    var game: Game?
    
    @IBAction func outcomeButtonPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        var plateAppearance: PlateAppearanceOutcome?
        
        switch buttonTitle {
        case "Single": plateAppearance = PlateAppearanceOutcome(result: .single)
        case "Double": plateAppearance = PlateAppearanceOutcome(result: .double)
        case "Triple": plateAppearance = PlateAppearanceOutcome(result: .triple)
        case "Homerun": plateAppearance = PlateAppearanceOutcome(result: .homerun)
        case "Walk": plateAppearance = PlateAppearanceOutcome(result: .walk)
        case "Hit By Pitch": plateAppearance = PlateAppearanceOutcome(result: .hitByPitch)
        default: break
        }
        
        if let appearance = plateAppearance {
            game?.plateAppearances.append(appearance)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "endGameSegue" {
            let boxScoreViewController = segue.destinationViewController as! BoxScoreViewController
            boxScoreViewController.game = game
        }
    }
    
}
