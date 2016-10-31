//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

//In the GithubAPIClient class, create a class function called getRepositories(with:) which takes in one argument named completion of type () -> Void. The job of this function is to fetch all the repositories from the Github API, and pass that array of dictionaries on to its completion closure.
//This method should know the URL to hit for the API request, create the URLSessionDataTask, and kick it off.
//In the completion closure for the data task, the method should deserialize the JSON data from the server.
//But how does this method get those objects back to the person who called it? It should take its own closure as an argument, which accepts the array of dictionaries as a parameter and returns nothing. Check out this helpful resource for an explanation on how to include a closure as a parameter for a function. The closure should return nothing and take one argument, an array of dictionaries.

import UIKit


class GithubAPIClient {
    
    class func getRepositories(with completion: @escaping ([[String: Any]]) -> Void) {
    
        let urlString = "https://api.github.com/repositories?client_id=\(Secrets.clientID)&client_secret=\(Secrets.clientSecret)"
        
        let url =  URL(string:urlString)
        
        if let unwrappedUrl = url{
        let session = URLSession.shared
        
        let task = session.dataTask(with: unwrappedUrl) {
            (data, response, error) in

            
            if let unwrappedData = data{
                do{
                  
                    let responseJson = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [[String:Any]]
    
                    completion(responseJson)
                } catch {
                    
                }
            }
            
            }
    
    
            
            
            
            
            
        task.resume()
     
        
    
            }
    }
    
    
}
    

    


