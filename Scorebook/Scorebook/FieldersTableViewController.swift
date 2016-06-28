//
//  FieldersTableViewController.swift
//  Scorebook
//
//  Created by Jonathan Arbogast on 6/25/16.
//  Copyright © 2016 Jonathan Arbogast. All rights reserved.
//

import UIKit

class FieldersTableViewController: UITableViewController {
    var save: (([Int]) -> Void)?
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        save?(fielderPositionsForIndexPaths(tableView.indexPathsForSelectedRows))
    }
    
    func fielderPositionsForIndexPaths(_ indexPaths: [IndexPath]?) -> [Int] {
        return indexPaths?.map { $0.row + 1 } ?? []
    }
}
