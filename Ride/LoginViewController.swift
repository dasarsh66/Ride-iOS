//
//  ViewController.swift
//  Ride
//
//  Created by student on 10/29/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    //LoginButton
    
    @IBAction func loginBTN(_ sender: Any) {
   
    }
    
    //Textfield to enter contact
    @IBOutlet weak var Contact: UITextField!
    //Textfield to enter Password
    @IBOutlet weak var password: UITextField!
    
    @IBAction func Button(_ sender: Any) {
    }
    
    @IBAction func registerBTN(_ sender: Any) {
        performSegue(withIdentifier: "regseg", sender: self)
//          if shouldPerformSegue(withIdentifier: "registerSegue", sender: self){
//           print("In button")
//            performSegue(withIdentifier: "registerSegue", sender: self)
//
//        }
    }
    
    //  if shouldPerformSegue(withIdentifier: "registerSegue", sender: self){
    //    performSegue(withIdentifier: "registerSegue", sender: self)
    //}
    @IBAction func recover(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "forgotPassSegue", sender: self){
            performSegue(withIdentifier: "forgotPassSegue", sender: self)
        }
        }
    
  
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue" {
          //  return databaseMangerInstance.loginUser(userEmail: emailTF.text!, userPassword: //passwordTF.text!)
            return true
        }
            
        else if identifier == "registerSegue"{
            print("In should perform Segue")
            return true
        }
        else if identifier == "forgotPassSegue" {
            return true
        }
        else if identifier == "regseg" {
            return true
        }
        else {
            return false
        }
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue"{
            _ = segue.destination as? HomeViewController
        }
        else if segue.identifier == "regseg" {
            _ = segue.destination as? RecoveryViewController
        }
        else if segue.identifier == "registerSegue" {
            print("In push")
            _ =  segue.destination as? RegisterViewController
        }
        else if segue.identifier == "forgotPassSegue" {
            _ = segue.destination as? RecoverViewController
        }
    }
    override func viewDidLoad() {
        Contact.placeholder="Email"
        password.placeholder="Password"
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

