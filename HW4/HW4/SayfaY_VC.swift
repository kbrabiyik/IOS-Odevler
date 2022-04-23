//
//  SayfaY_VC.swift
//  HW4
//
//  Created by KUBRANIN MACİ on 24.04.2022.
//

import UIKit

class SayfaY_VC: UIViewController {

    @IBOutlet weak var sayfaY_Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    @IBAction func geriGit_button(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
