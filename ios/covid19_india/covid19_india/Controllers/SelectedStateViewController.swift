//
//  SelectedStateViewController.swift
//  covid19_india
//
//  Created by Varunraj on 02/08/2020.
//  Copyright © 2020 Varunraj. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps


class SelectedStateViewController: UIViewController {
    
    @IBOutlet weak var stateConfirmed: UILabel!
    @IBOutlet weak var stateActive: UILabel!
    @IBOutlet weak var stateRecovered: UILabel!
    @IBOutlet weak var stateDeceased: UILabel!
    @IBOutlet weak var Districtwise: UIButton!
    @IBOutlet weak var mapView: GMSMapView!
    var selectedState:StateDataModel?
    var currentState:String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        // Do any additional setup after loading the view.
       
        
        
    }
    
    override func viewDidLayoutSubviews() {
     getMap()
        
        
    }
    
    
    
    
    func loadData(){
        if let stateData = selectedState{
            stateConfirmed.text = "Confirmed :  \(stateData.confirmed)"
            stateActive.text = "Active : \(stateData.active)"
            stateRecovered.text = "Recovered : \(stateData.recovered)"
            stateDeceased.text = "Deceased :  \(stateData.deceased)"
            currentState = stateData.stateName
           
        }
    }
    
    func getMap(){
        if let selectedState = currentState{
            
            getCoordinate(addressString: selectedState ) { (CLLocationCoordinate2D, error) in
                                          if error != nil{
                                              print(error)
                                          }else{
                                             
                                            let camera = GMSCameraPosition.camera(withLatitude: CLLocationCoordinate2D.latitude, longitude: CLLocationCoordinate2D.longitude, zoom: 7.5)
                                                        let mapView = GMSMapView.map(withFrame: self.mapView.frame, camera: camera)
                                                        self.view.addSubview(mapView)

                                                        // Creates a marker in the center of the map.
                                                        let marker = GMSMarker()
                                                        //marker.position = CLLocationCoordinate2D(latitude: 10.9952298, longitude: 78.4142951)
                                                        marker.title = "Sydney"
                                                        marker.snippet = "Australia"
                                                        marker.map = mapView
                                            
                                            
                                            
                                            
                                          }
                                      }
            
        }
        
         
            
        
        
      
    }
    
    
    func getCoordinate( addressString : String,
            completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                        
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
                
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
    
    


}
