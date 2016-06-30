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
    var pendingOutcome: PlateAppearanceOutcome?
    
    @IBAction func outcomeButtonPressed(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        var outcome: PlateAppearanceOutcome?
        
        switch buttonTitle {
        case "Single": outcome = PlateAppearanceOutcome(result: .single)
        case "Double": outcome = PlateAppearanceOutcome(result: .double)
        case "Triple": outcome = PlateAppearanceOutcome(result: .triple)
        case "Homerun": outcome = PlateAppearanceOutcome(result: .homerun)
        case "Walk": outcome = PlateAppearanceOutcome(result: .walk)
        case "Hit By Pitch": outcome = PlateAppearanceOutcome(result: .hitByPitch)
        case "Error": pendingOutcome = PlateAppearanceOutcome(result: .error)
        case "Fielder's Choice": pendingOutcome = PlateAppearanceOutcome(result: .fieldersChoice)
        default: break
        }
        
        if let outcome = outcome {
            game?.plateAppearances.append(outcome)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "endGameSegue" {
            let boxScoreViewController = segue.destinationViewController as! BoxScoreViewController
            boxScoreViewController.game = game
        } else if segue.identifier == "selectFielders" {
            let fieldersViewController = segue.destinationViewController as! FieldersTableViewController
            fieldersViewController.save = { [weak self] fielders in
                if let finalOutcome = self?.pendingOutcome?.outcomeByAddingFielders(fielders) {
                    self?.game?.plateAppearances.append(finalOutcome)
                    self?.pendingOutcome = nil
                }
            }
        }
    }
    
}
