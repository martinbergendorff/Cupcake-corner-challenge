//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Martin Bergendorff on 2022-04-06.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var wrappedOrder : WrappedOrder
    
    var body: some View {
        
        Form {
            Section {
                TextField("Name", text: $wrappedOrder.order.name)
                TextField("Street", text:  $wrappedOrder.order.street)
                TextField("City", text: $wrappedOrder.order.city)
                TextField("Zip", text: $wrappedOrder.order.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckOutView(wrappedOrder: wrappedOrder)
                }
            }
            .disabled(wrappedOrder.order.validAddress == false)
            
        }
        .navigationTitle("Delievery details")
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
//        AddressView(order: Order())
        AddressView(wrappedOrder: WrappedOrder())
    }
}
