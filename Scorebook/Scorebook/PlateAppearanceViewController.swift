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
    let plateAppearance = PlateAppearance()
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "nextPlateAppearanceSegue" {
            game?.plateAppearances.append(plateAppearance)
            
            let plateAppearanceViewController = segue.destinationViewController as! PlateAppearanceViewController
            plateAppearanceViewController.game = game
        } else if segue.identifier == "endGameSegue" {
            game?.plateAppearances.append(plateAppearance)
            
            let navController = segue.destinationViewController as! UINavigationController
            let boxScoreViewController = navController.childViewControllers[0] as! BoxScoreViewController
            boxScoreViewController.game = game
        }
    }
}

