//
//  ViewController.swift
//  MapView
//
//  Created by George Fang on 2016-06-22.
//  Copyright © 2016 George Fang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
{

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var segControl: UISegmentedControl!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        //self.mapView.mapType = MKMapType.Satellite
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true
        
    }

    @IBAction func tapSegControl(sender: UISegmentedControl) {
        if segControl.selectedSegmentIndex == 0 {
            self.mapView.mapType = MKMapType.Standard
        }
        if segControl.selectedSegmentIndex == 1 {
            self.mapView.mapType = MKMapType.Satellite
        }
        if segControl.selectedSegmentIndex == 2 {
            self.mapView.mapType = MKMapType.Hybrid
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //  Marks - Location Delegate Methord
    
    func locationManager(maneger: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.mapView.setRegion(region, animated: true)
        

        
        self.locationManager.stopUpdatingLocation()
        
    }
    
    @IBAction func tapedExit(sender: UIButton) {
        exit(0)
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
    }
}


