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
    
    @IBAction func outcomeButtonPressed(sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        var plateAppearance: PlateAppearanceOutcome?
        
        switch buttonTitle {
        case "Single": plateAppearance = PlateAppearanceOutcome(result: .Single)
        case "Double": plateAppearance = PlateAppearanceOutcome(result: .Double)
        case "Triple": plateAppearance = PlateAppearanceOutcome(result: .Triple)
        case "Homerun": plateAppearance = PlateAppearanceOutcome(result: .Homerun)
        default: break
        }
        
        if let appearance = plateAppearance {
            game?.plateAppearances.append(appearance)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "endGameSegue" {
            let boxScoreViewController = segue.destinationViewController as! BoxScoreViewController
            boxScoreViewController.game = game
        }
    }
}
