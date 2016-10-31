//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    var store = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      store.getRepositoriesFromAPI(with: {
         DispatchQueue.main.async {
            self.tableView.reloadData()
        }
      })
        
        self.tableView.accessibilityLabel = "tableView"
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath)
        let infoAPI = store.repositories[indexPath.row]
        cell.detailTextLabel?.text = String(describing: infoAPI.htmlURL)
        cell.textLabel?.text = infoAPI.fullName 
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
}
