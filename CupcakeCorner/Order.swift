//
//  Order.swift
//  CupcakeCorner
//
//  Created by Martin Bergendorff on 2022-04-06.
//

import Foundation

extension String {
    func checkForSpaces() -> Bool {
        if self.trimmingCharacters(in: .whitespaces) == "" {
            return true
        }
        return false
    }
}

struct Order : Codable {
   
    /*
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)

        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        sprinkles = try container.decode(Bool.self, forKey: .sprinkles)

        name = try container.decode(String.self, forKey: .name)
        street = try container.decode(String.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    */
     
    init() {}
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Raspberry"]
    
    var type = 0
    var quantity = 3
    var specialRequest = false {
        didSet {
            if specialRequest == false {
                extraFrosting = false
                sprinkles = false
            }
        }
    }
    var extraFrosting = false
    var sprinkles = false
    var name = ""
    var street = ""
    var city = ""
    var zip = ""
    
     var validAddress : Bool {
         if  name.checkForSpaces() || street.allSatisfy({$0.isWhitespace}) || city.checkForSpaces() || zip.checkForSpaces() {
            return false
        }
        return true
    }
    
    var cost : Double {
        // 2$ per
        var cost = Double(quantity) * 2
        //Add cost depending on type.
        cost += Double(type) / 2
        
        if extraFrosting {
            cost += Double(quantity) //Double(quantity) * 1
        }
        
        if sprinkles {
            cost += Double(quantity) * 0.5
        }
        
        return cost
    }
    /*
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)

        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(sprinkles, forKey: .sprinkles)

        try container.encode(name, forKey: .name)
        try container.encode(street, forKey: .street)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
    }
     */
    
}
