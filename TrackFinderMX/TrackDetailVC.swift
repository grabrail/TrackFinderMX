//
//  TrackDetailVC.swift
//  TrackFinderMX
//
//  Created by Jade Reynolds on 15/02/2017.
//  Copyright © 2017 ShutterMX. All rights reserved.
//

import UIKit

class TrackDetailVC: UIViewController {
    
    var track: Tracks!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = track.name
    }

    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
