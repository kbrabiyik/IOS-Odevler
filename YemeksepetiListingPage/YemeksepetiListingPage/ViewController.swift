//
//  ViewController.swift
//  YemeksepetiListingPage
//
//  Created by KUBRANIN MACİ on 5.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vendorsTableView: UITableView!
    
    var vendorsList = [Restoranlar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendorsTableView.delegate = self
        vendorsTableView.dataSource = self
        self.navigationItem.title = "Yemeksepeti"
        
        let appearance1 = UINavigationBarAppearance()
        appearance1.backgroundColor = UIColor(named: "ys-color")
        appearance1.titleTextAttributes = [.foregroundColor:UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance1
        navigationController?.navigationBar.compactAppearance = appearance1
        navigationController?.navigationBar.scrollEdgeAppearance = appearance1
        
        if let tabItems = tabBarController?.tabBar.items {
            let item = tabItems[2]
            item.badgeValue = "1"
        }
        
        let appearance2 = UITabBarAppearance()
        appearance2.backgroundColor = UIColor.white
        itemRenkdegistir(itemAppearance: appearance2.stackedLayoutAppearance)
        itemRenkdegistir(itemAppearance: appearance2.inlineLayoutAppearance)
        itemRenkdegistir(itemAppearance: appearance2.compactInlineLayoutAppearance)
        tabBarController?.tabBar.standardAppearance = appearance2
        tabBarController?.tabBar.scrollEdgeAppearance = appearance2
        
        let appearance3 = UISearchBar()
        appearance3.backgroundColor = UIColor(named: "ys-color")
        appearance3.searchTextField.backgroundColor = UIColor.white
       
        
        func itemRenkdegistir(itemAppearance:UITabBarItemAppearance){
            
            //seçili olmayan durum rengi
            itemAppearance.normal.iconColor = UIColor.gray
            itemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
            itemAppearance.normal.badgeBackgroundColor = UIColor(named: "ys-color")
            //seçili olan
            
            itemAppearance.selected.iconColor = UIColor(named: "ys-color")
            itemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ys-color")]
            
        }
        
        
        let v1 = Restoranlar(vendor_id: 1, vendor_name: "Burger King", vendor_category_name: "Burger - Atakum (Körfez Mah.)", vendor_image_name: "Burger_King_logo", vendor_score: "8,5", delivery_fee: "0,00 TL", minimum_order_value: "49,99 TL", delivery_time: "35-45 dk.")
        let v2 = Restoranlar(vendor_id: 2, vendor_name: "McDonald's", vendor_category_name: "McDonald's - Atakum (Kurupelit Mah.)", vendor_image_name: "Mcdonalds-Logo", vendor_score: "8,9", delivery_fee: "0,00 TL", minimum_order_value: "39,99 TL", delivery_time: "40-50 dk.")
        let v3 = Restoranlar(vendor_id: 3, vendor_name: "Popeyes", vendor_category_name: "Popeyes - Atakum (Cumhuriyet Mah.)", vendor_image_name: "Popeyes-Symbol", vendor_score: "8,2", delivery_fee: "0,00 TL", minimum_order_value: "39,99 TL", delivery_time: "45-50 dk.")
        let v4 = Restoranlar(vendor_id: 4, vendor_name: "Starbucks Coffee", vendor_category_name: "Starbucks Coffee - Atakum (Denizevleri Mah.)", vendor_image_name: "Starbucks-Logo", vendor_score: "9,2", delivery_fee: "7,99 TL", minimum_order_value: "30,00 TL", delivery_time: "20-30 dk.")
        let v5 = Restoranlar(vendor_id: 4, vendor_name: "Usta Pideci", vendor_category_name: "Usta Pideci - Atakum (İstiklal Mah.)", vendor_image_name: "usta-pideci", vendor_score: "9,5", delivery_fee: "0,00 TL", minimum_order_value: "42,99 TL", delivery_time: "30-40 dk.")
        vendorsList.append(v1)
        vendorsList.append(v2)
        vendorsList.append(v3)
        vendorsList.append(v4)
        vendorsList.append(v5)
        
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vendorsList.count // kaç ürün gösterilecek belirtiyoruz
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vendor = vendorsList[indexPath.row] // sırası ile değerleri getirecek
        let cell = tableView.dequeueReusableCell(withIdentifier: "VendorCell", for: indexPath) as! VendorTableViewCell
        
        cell.vendorImageUIView.image = UIImage(named: vendor.vendor_image_name!)
        cell.vendorNameLabel.text = vendor.vendor_name
        cell.vendorScoreLabel.text = vendor.vendor_score
        cell.vendorCategoryLabel.text = vendor.vendor_category_name
        cell.deliveryFeeLabel.text = vendor.delivery_fee
        cell.deliveryTimeLabel.text = vendor.delivery_time
        cell.minimumOrderValueLabel.text = vendor.minimum_order_value
        
        return cell
    }
    
    
}
