//
//  RegisterViewController.swift
//  Ride
//
//  Created by student on 10/29/17.
//  Copyright © 2017 student. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    let databaseManagerInstance : DatabaseManager = DatabaseManager()
 
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var reEnterPasswordTF: UITextField!

    
    
 //   @IBAction func Submit(_ sender: Any) {
   //         self.dismiss(animated: true, completion: nil)
        
    //    let register = Register(Lastname: LastName.text, Firstname: FirstName.text, email: //emailTF.text!, password: Password.text)
      //  databaseManager.add(reg: register)
        
//        if shouldPerformSegue(withIdentifier: "registerSegue", sender: self){
//            performSegue(withIdentifier: "registerSegue", sender: self)
//        }
//        else {
//            let alertController = UIAlertController(title: "Message", message: "Invalid Email or passwor match", preferredStyle: .alert)
//            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
//            self.present(alertController, animated: true, completion: nil)
//        }
                     //   }
    
    @IBAction func GoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if passwordTF.text! == reEnterPasswordTF.text!{
//            print("Equal")
//        }
//        print(identifier)
//        if identifier == "registerSegue" && passwordTF.text! == reEnterPasswordTF.text!
//        {
//
//            return databaseManagerInstance.registerUser(userEmail: emailTF.text!, userPassword: passwordTF.text!)
//        }
//
//
//        if identifier == "loginSegue" {
//            return true
//        }
//        else {
//            return false
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.placeholder="Enter emailID"
        passwordTF.placeholder="Password"
        reEnterPasswordTF.placeholder="Confirm Password"
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
