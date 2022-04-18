//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Martin Bergendorff on 2022-04-06.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order : Order
    
    //@State private var name = ""
    
    var body: some View {
        
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street", text:  $order.street)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckOutView(order: order)
                }
            }
            .disabled(order.validAddress == false)
            
        }
        .navigationTitle("Delievery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
