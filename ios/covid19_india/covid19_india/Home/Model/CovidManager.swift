//
//  Covid19Data.swift
//  covid19_india
//
//  Created by Varunraj on 03/07/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import Foundation

protocol CovidDataDelegate {
    func updateCounts(covidData:CovidDataModel)
}


struct CovidManager {
    
    var delegate:CovidDataDelegate?
    
    let covidUrl = "https://api.covidindiatracker.com/total.json"
    func getUrl(){
        let url = covidUrl
        connnectWebAPI(webUrl: url)
    }
    func connnectWebAPI(webUrl:String){
       //1. create Url
        if let url = URL(string: webUrl){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                }
                if let safeData = data{
                    if let updatedData = self.parseJSON(covidData: safeData){
                        self.delegate?.updateCounts(covidData: updatedData)
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(covidData:Data)->CovidDataModel?{
        let decoder = JSONDecoder()
        
        
        do {
            let decodedData = try decoder.decode(CovidJSON.self, from: covidData)
            let confirmedData =  String(decodedData.confirmed)
            let activeData = String(decodedData.active)
            let recoveredData = String(decodedData.recovered)
            let deceasedData = String(decodedData.deaths)
            let myCovidData = CovidDataModel(active: activeData, confirmed: confirmedData, recovered: recoveredData, deceased: deceasedData)
            return myCovidData
            
        } catch {
            print(error)
            return nil
        }
        
        
    }
   
    
}
