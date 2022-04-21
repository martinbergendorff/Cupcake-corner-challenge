//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Martin Bergendorff on 2022-03-23.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var wrappedOrder = WrappedOrder()
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("Select type of cupcake", selection: $wrappedOrder.order.type) {
                        ForEach(Order.types.indices) {i in
                            Text(Order.types[i]) // $0
                        }
                    }
                }
                
                Section {
                    Stepper("Select quantity: \(wrappedOrder.order.quantity)", value: $wrappedOrder.order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Special requests", isOn: $wrappedOrder.order.specialRequest.animation())
                    
                    if wrappedOrder.order.specialRequest {
                        Toggle("Extra frosting", isOn:  $wrappedOrder.order.extraFrosting)
                        Toggle("Extra sprinkles", isOn: $wrappedOrder.order.sprinkles)
   
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(wrappedOrder: wrappedOrder)
                    }
                }   
            }
            .navigationTitle("Cupcake Corner")
        } 
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
