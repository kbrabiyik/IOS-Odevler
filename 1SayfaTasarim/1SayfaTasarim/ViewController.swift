//
//  ViewController.swift
//  1SayfaTasarim
//
//  Created by KUBRANIN MACİ on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Detail"
        
        let appearance = UINavigationBarAppearance()
    
        // ARKAPLAN RENGİ
        appearance.backgroundColor = UIColor(named: "anarenk")
        //başlık
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yazi2")!, NSAttributedString.Key.font : UIFont(name: "AbrilFatface-Regular", size: 22)!]
        //status bar
        navigationController?.navigationBar.barStyle = .black
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
    
    }

}

