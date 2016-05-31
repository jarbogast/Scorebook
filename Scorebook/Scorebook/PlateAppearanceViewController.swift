//
//  ViewController.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 5/30/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import UIKit

class PlateAppearanceViewController: UIViewController, PlateAppearanceDelegate {
    var game: Game?
    var plateAppearance = PlateAppearance()
    
    @IBAction func addBallButtonTouched() {
        plateAppearance.balls += 1
    }
    
    @IBAction func addStrikeButtonPressed() {
        plateAppearance.strikes += 1
    }
    
    @IBAction func ballInPlayButtonTouched() {
        plateAppearance.outcome = .Hit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plateAppearance.delegate = self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "endGameSegue" {            
            let navController = segue.destinationViewController as! UINavigationController
            let boxScoreViewController = navController.childViewControllers[0] as! BoxScoreViewController
            boxScoreViewController.game = game
        } else if segue.identifier == "nextPlateAppearanceSegue" {
            let paViewController = segue.destinationViewController as! PlateAppearanceViewController
            paViewController.game = game
        }
    }
    
    func plateAppearanceOutcomeDidChange(plateAppearance: PlateAppearance, outcome: PlateAppearanceOutcome?) {
        if plateAppearance.outcome != nil {
            game?.plateAppearances.append(plateAppearance)
            performSegueWithIdentifier("nextPlateAppearanceSegue", sender: self)
        }
    }
}

