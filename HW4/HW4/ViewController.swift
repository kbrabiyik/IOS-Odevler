//
//  ViewController.swift
//  HW4
//
//  Created by KUBRANIN MACİ on 24.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelAnasayfa: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gitA_button(_ sender: Any) {
        performSegue(withIdentifier: "Anasayfa-A", sender: nil)
    }
    
    @IBAction func gitX_button(_ sender: Any) {
        performSegue(withIdentifier: "Anasayfa-X", sender: nil)
    }
    
}

