//
//  billCalculator.swift
//  Ride
//
//  Created by student on 12/3/17.
//  Copyright © 2017 student. All rights reserved.
//

import Foundation
class BillCalculator {

static  func calculate(distance:Double, rating:String) -> Double {
    
    let speed:Double = 22
    var costPerMinute:Double = 0.22
    var costPerMile:Double = 1.21
    var bookingCost:Double = 2
    var baseFare:Double = 2
    var time:Double = 0
    var total:Double = 0
    let timeInTraffic:Double = 27
    //Typical average time spent in traffic at 6:15 pm, Friday through Saturday, since this calculates with out taking traffic into account, we add a few minutes(time in traffic)
    if rating == "X5" {
        costPerMinute = 0.43
        costPerMile = 1.35
        bookingCost = 2.5
        baseFare = 2.85
        time = (timeInTraffic+2)+distance/speed
        print("printing time in X5",time)
        total = bookingCost+baseFare+(time*costPerMinute)+(distance*costPerMile)
            }
    else if rating == "X4" {
        costPerMinute = 0.22
        costPerMile = 1.21
        bookingCost = 2
        baseFare = 2.3
        time = (timeInTraffic)+(distance/speed)
        print("print X4",time)
        total = bookingCost+baseFare+(time*costPerMinute)+(distance*costPerMile)
                }
    else {
         costPerMinute = 0.15
         costPerMile = 1.1
         bookingCost = 1.5
         baseFare = 2
         time = (timeInTraffic)+distance/speed
         total = bookingCost+baseFare+(time*costPerMinute)+(distance*costPerMile)
    }
    return total
}
}


