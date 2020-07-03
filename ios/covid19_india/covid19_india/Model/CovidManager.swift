//
//  Covid19Data.swift
//  covid19_india
//
//  Created by Varunraj on 03/07/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import Foundation

struct CovidManager {
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
                    self.parseJSON(covidData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(covidData:Data){
        let decoder = JSONDecoder()
        
        
        do {
            let decodedData = try decoder.decode(CovidJSON.self, from: covidData)
            //getActive(activeData: decodedData.confirmed)
            print(decodedData.active)
            print(decodedData.recovered)
            print(decodedData.deaths)
        } catch {
            print(error)
        }
        
    }
   
    
}
