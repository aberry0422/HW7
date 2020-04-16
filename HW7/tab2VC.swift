//
//  tab2VC.swift
//  HW7
//
//  Created by Ashawn C Berry on 4/16/20.
//  Copyright © 2020 Ashawn C Berry. All rights reserved.
//

import UIKit
import CoreLocation

class tab2VC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var distanceLabel: UILabel!
    
    
    
    
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    
    let cpLatitude: CLLocationDegrees = 41.4822
    let cpLongitude: CLLocationDegrees = -82.6835
        
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        if newLocation.horizontalAccuracy >= 0 {
            
            let cp:CLLocation = CLLocation(latitude: cpLatitude, longitude: -82.6835)
            let delta:CLLocationDistance = cp.distance(from: newLocation)
            let miles: Double = (delta * 0.569)
            if miles < 1 {
                locMan.stopUpdatingLocation()
                distanceLabel.text = "Enjoy\n Cedar Point"
            } else{
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to Cedar Point"
            }
            
        }
        
        }
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyKilometer
        locMan.distanceFilter = 1689;
        locMan.requestWhenInUseAuthorization()
        locMan.startUpdatingLocation()
        startLocation = nil

    }
    
    
      


        // Do any additional setup after loading the view.
      
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


