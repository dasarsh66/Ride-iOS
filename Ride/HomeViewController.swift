//
//  HomeViewController.swift
//  Ride
//
//  Created by student on 10/29/17.
//  Copyright © 2017 student. All rights reserved.
//40.349629, -94.871438

import UIKit
import MapKit

//Protocol to handle map search
protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
    }
//Variable to store selected pin 
var selectedPin:MKPlacemark? = nil
class HomeViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    //Categories we divided into
    let categories = ["X5", "X4", "X3"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //PickerView
    @IBOutlet weak var ratingPV: UIPickerView!
    //Label which displays selected rating
    @IBOutlet weak var selectedRatingLBL: UILabel!
    //PickerView Delegate methods
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       // pickerView.isHidden = true
       // SelectionB.setTitle(ratingPV[row], for: .normal)
        selectedRatingLBL.text = categories[row]
    }
    //Search controller
    var resultSearchController:UISearchController? = nil
    var selected = ""
    //Calculate Button
    @IBAction func calculateBillBTN(_ sender: Any) {
        CalBill()
        print("In calculate Bill Button",selectedRatingLBL.text!)
         selected = selectedRatingLBL.text!
    }
    //Variables to store results and distance
    var result:Double = 0
    //Distance is measured in meters meters, Here it is being converted into miles
    var distance:Double = distanceInMeters/1609
    //Function to calculate bill
    func CalBill() -> Double {
       // var result = BillCalculator.calculate(Distance: 22, Rating:  selectedRatingLBL.text!)
        result = BillCalculator.calculate(distance: distance, rating: selectedRatingLBL.text!)
        return result
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! BillViewController
        destinationViewController.cost = result
    }
    //mapView
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var Location: UITextField!
    let manager = CLLocationManager()
    override func viewDidLoad() {
        ratingPV.dataSource = self
        ratingPV.delegate = self
        
        manager.delegate=self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.showsScale = true
        mapView.showsPointsOfInterest = true
        mapView.showsUserLocation = true
        super.viewDidLoad()
        
        Location.placeholder = "Enter Destination"
        // Do any additional setup after loading the view.
        //Location search table
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "LocationSearchTableViewController") as! LocationSearchTableViewController
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        //Instantiating a result search controller
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
       
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func
     (for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
    var distanceInMeters:Double = 0.0
    extension HomeViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        print("Coordinates on tap",placemark.coordinate)
        let coordinateUCSF = CLLocation(latitude:37.763140,longitude:-122.457564)
        let coordinate1 = CLLocation(latitude: placemark.coordinate.latitude,longitude: placemark.coordinate.longitude)
        print("Printing coordinates in coordinate 1", coordinate1)
        print("Printing Distance in meters",coordinateUCSF.distance(from: coordinate1))
        distanceInMeters = coordinateUCSF.distance(from: coordinate1)
        //Adding a pin for UCSF
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = coordinateUCSF.coordinate
        dropPin.title = "UCSF"
        mapView.addAnnotation(dropPin)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "(city) (state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.14, 0.00001)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        mapView.setRegion(region, animated: true)
    }
}

//37.780090, -122.389192 ATT Park coordinates
//37.785834000000001, longitude: -122.406417 ucsf google







