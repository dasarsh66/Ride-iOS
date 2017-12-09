//
//  PinIt!.swift
//  Ride
//
//  Created by student on 11/3/17.
//  Copyright © 2017 student. All rights reserved.
// 40.349629, -94.871438

import MapKit

class Pinit: NSObject, MKAnnotation, MKMapViewDelegate {
    
    var coordinate: CLLocationCoordinate2D
    var subtitle: String?
    var title: String?
    
    init(coordinate:CLLocationCoordinate2D?, subtitle:String?, title:String?){
        self.coordinate = coordinate!
        self.subtitle = subtitle
        self.title = title
    }
}
