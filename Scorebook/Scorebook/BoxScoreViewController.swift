//
//  BoxScoreViewController.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 5/30/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import UIKit

class BoxScoreViewController: UIViewController {
    
    @IBOutlet weak var plateAppearancesLabel: UILabel!
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numPlateAppearances = game?.plateAppearances.count ?? 0
        plateAppearancesLabel.text = "\(numPlateAppearances) plate appearances"
    }
}
