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
    
    @IBOutlet weak var stateName: UILabel!
    @IBOutlet weak var stateConfirmed: UILabel!
    @IBOutlet weak var stateActive: UILabel!
    @IBOutlet weak var stateRecovered: UILabel!
    @IBOutlet weak var stateDeceased: UILabel!
    @IBOutlet weak var Districtwise: UIButton!
    @IBOutlet weak var mapView: GMSMapView!
    var selectedState:StateDataModel?
    var currentState:String?
    
    @IBOutlet weak var stackViewList: UIStackView!
    let col1 = UIColor(red: 0.961, green: 0.881, blue: 0.931, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        stackViewList.addBackground(color: col1)
        loadData()
        
        // Do any additional setup after loading the view.
       
        getMap()
        
    }
    

    
    
    
    
    func loadData(){
        if let stateData = selectedState{
            stateName.text = (stateData.stateName).uppercased()
            stateConfirmed.text = "Confirmed :  \(stateData.confirmed)".uppercased()
            stateActive.text = "Active : \(stateData.active)".uppercased()
            stateRecovered.text = "Recovered : \(stateData.recovered)".uppercased()
            stateDeceased.text = "Deceased :  \(stateData.deceased)".uppercased()
            currentState = stateData.stateName
           
        }
    }
    
    func getMap(){
        if let selectedState = currentState{
            
            getCoordinate(addressString: selectedState ) { (CLLocationCoordinate2D, error) in
                                          if error != nil{
                                              print("Error loading Data")
                                          }else{
                                            
                                            let camera = GMSCameraPosition.camera(withLatitude: CLLocationCoordinate2D.latitude, longitude: CLLocationCoordinate2D.longitude, zoom: 7.5)
                                                        let mapView = GMSMapView.map(withFrame: self.mapView.frame, camera: camera)
                                                        self.view.addSubview(mapView)

                                                        // Creates a marker in the center of the map.
                                                        let marker = GMSMarker()
                                                        //marker.position = CLLocationCoordinate2D(latitude: 10.9952298, longitude: 78.4142951)
                                                      
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

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
