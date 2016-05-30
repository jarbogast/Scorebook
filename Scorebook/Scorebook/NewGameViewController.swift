//
//  NewGameViewController.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 5/30/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController {
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "startGameSegue" {
            let plateAppearanceViewController = segue.destinationViewController as! PlateAppearanceViewController
            plateAppearanceViewController.game = Game()
        }
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
    
    }
}
