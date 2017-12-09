//
//  BillViewController.swift
//  Ride
//
//  Created by student on 11/3/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit

class BillViewController: UIViewController {

    var cost:Double!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        Bill.text = String(format:"%.2f",cost!)
    }
    
@IBOutlet weak var Bill: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
