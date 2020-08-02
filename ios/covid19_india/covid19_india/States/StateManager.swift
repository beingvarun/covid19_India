//
//  StateManager.swift
//  covid19_india
//
//  Created by Varunraj on 01/08/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import Foundation

struct StateManager {
    
    func getAPI(){
        
        let webAPI = "https://api.covid19india.org/data.json"
        connectWebAPI(url: webAPI)
    }
    
    func connectWebAPI(url:String){
        
        if let stateURL = URL(string: url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: stateURL) { (data, response, error) in
                if error != nil{
                    print("something happened wrong\(error)")
                }
                if let safeData = data{
                    parseJSON(stateData:safeData)
                }
                
            }
            task.resume()
        }
        
        
        func parseJSON(stateData:Data){
            let decoder = JSONDecoder()
            do{
                 let decodedData = try decoder.decode(StateData.self, from: stateData)
                print(decodedData.statewise[0])
            }catch{
                print("jason parsing eroor\(error)")
            }
            
           
            
        }
        
        
        
    }
    
    
    
    
    
}
