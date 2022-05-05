//
//  Restoranlar.swift
//  YemeksepetiListingPage
//
//  Created by KUBRANIN MACİ on 5.05.2022.
//

import Foundation

class Restoranlar {
    var vendor_id:Int?
    var vendor_name:String?
    var vendor_category_name:String?
    var vendor_image_name:String?
    var vendor_score:String?
    var delivery_fee:String?
    var minimum_order_value:String?
    var delivery_time:String?
    
    init(vendor_id:Int,vendor_name:String,vendor_category_name:String,vendor_image_name:String,vendor_score:String,delivery_fee:String,minimum_order_value:String,delivery_time:String) {
        self.vendor_id = vendor_id
        self.vendor_name = vendor_name
        self.vendor_category_name = vendor_category_name
        self.vendor_image_name = vendor_image_name
        self.vendor_score = vendor_score
        self.delivery_fee = delivery_fee
        self.minimum_order_value = minimum_order_value
        self.delivery_time = delivery_time
    }
    
}
