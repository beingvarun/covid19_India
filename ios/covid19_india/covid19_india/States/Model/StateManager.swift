//
//  StateManager.swift
//  covid19_india
//
//  Created by Varunraj on 01/08/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import Foundation

protocol StateDataDelegate {
    func updateStateCounts(covidCleanData:Array<StateDataModel>)
}






struct StateManager {
    
    var newdelegate:StateDataDelegate?
    func getAPI(){
        
        let webAPI = "https://api.covid19india.org/data.json"
        connectWebAPI(url: webAPI)
    }
    
    func connectWebAPI(url:String){
        
        if let stateURL = URL(string: url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: stateURL) { (data, response, error) in
                if error != nil{
                    print("something happened wrong\(error ?? "error while connecting" as! Error)")
                }
                if let safeData = data{
                    if let cleanedUpdatedData =  parseJSON(stateData:safeData){
                        self.newdelegate?.updateStateCounts(covidCleanData: cleanedUpdatedData)
                        
                        
                    }
                }
                
            }
            task.resume()
        }
        
        
        
        
        
        func parseJSON(stateData:Data)->[StateDataModel]?{
            var cleanedData = [StateDataModel]()
            let decoder = JSONDecoder()
            do{
                 var decodedData = try decoder.decode(StateData.self, from: stateData)
                 decodedData.statewise.remove(at: 0)
                 for covid_state in decodedData.statewise{
                    if let covidActive = Int(covid_state.active), let covidConfirmed = Int(covid_state.confirmed),
                        let covidDeceased = Int(covid_state.deaths), let covidRecovered = Int(covid_state.recovered){
                        let covidStateName = covid_state.state
                        let covidStateCode = covid_state.statecode
                        let covidStateData = StateDataModel(stateName: covidStateName, active: covidActive, confirmed: covidConfirmed, recovered: covidRecovered, deceased: covidDeceased, statecode: covidStateCode)
                        cleanedData.append(covidStateData)
                    }
                }

              return cleanedData
            }catch{
                print("jason parsing eroor\(error)")
                return nil
            }
            
           
            
        }
        
        
        
    }
    
    
    
    
    
}
