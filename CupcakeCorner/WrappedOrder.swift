//
//  WrappedOrder.swift
//  CupcakeCorner
//
//  Created by Martin Bergendorff on 2022-04-20.
//

import Foundation

class WrappedOrder : ObservableObject, Codable {
    

    
    @Published var order = Order()
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        order = try container.decode(Order.self, forKey: .order)
    }
    
    // required init(from decoder: Decoder) throws {
       //  let container = try decoder.container(keyedBy: CodingKeys.self)
        
//        order = try container.decode(order, forKey: CodingKeys.self)
//        order.type = try container.decode(Int.self, forKey: .type)
//        order.quantity = try container.decode(Int.self, forKey: .quantity)
//
//        order.extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//        order.sprinkles = try container.decode(Bool.self, forKey: .sprinkles)
//
//        order.name = try container.decode(String.self, forKey: .name)
//        order.street = try container.decode(String.self, forKey: .street)
//        order.city = try container.decode(String.self, forKey: .city)
//        order.zip = try container.decode(String.self, forKey: .zip)
    //}
    
    init() {}
    
    func encode(to encoder : Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(order, forKey: .order)
        
//        var container = try encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(order.type, forKey: .type)
//        try container.encode(order.quantity, forKey: .quantity)
//
//        try container.encode(order.extraFrosting, forKey: .extraFrosting)
//        try container.encode(order.sprinkles, forKey: .sprinkles)
//
//        try container.encode(order.name, forKey: .name)
//        try container.encode(order.street, forKey: .street)
//        try container.encode(order.city, forKey: .city)
//        try container.encode(order.zip, forKey: .zip)
    }
    
}
