//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories = [GithubRepository]()
    


    
  func  getRepositoriesFromAPI(with completion: @escaping () -> ()){
        repositories.removeAll()
    GithubAPIClient.getRepositories(with: { repos in
        for repo in repos {
           let GitHubRepo = GithubRepository.init(dictionary: repo)
            self.repositories.append(GitHubRepo)
        }
       completion()
    })
    }
}
