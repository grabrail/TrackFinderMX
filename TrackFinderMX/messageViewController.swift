//
//  messageViewController.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 29/03/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class messageViewController: UIViewController {
    
    
    @IBOutlet weak var trackNameField: UITextField!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var postcodeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(messageViewController.dismissKeyboard)   )
        view.addGestureRecognizer(tap)
    }
    
    let ref = FIRDatabase.database().reference(withPath: "newTracks")
   
    @IBAction func saveBtnTapped(_ sender: Any) {
        
        var name: String
        var country: String
        var postcode: String
        name = trackNameField.text!
        country = countryField.text!
        postcode = postcodeField.text!
        let newTrack = addTrack(name: name, country: country, postcode: postcode)
        let newTrackRef = self.ref.child(name.lowercased())
        newTrackRef.setValue(newTrack.toAnyObject())
        
        let alertController = UIAlertController(title: "Thank You!", message: "Your Submission Has Been Recieved", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
    

