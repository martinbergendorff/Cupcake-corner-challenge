//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Martin Bergendorff on 2022-03-23.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var order = Order()
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    Picker("Select type of cupcake", selection: $order.type) {
                        ForEach(Order.types.indices) {i in
                            Text(Order.types[i]) // $0
                        }
                    }
                }
                Section {
                    Stepper("Select quantity: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Special requests", isOn: $order.specialRequest.animation())
                    
                    if order.specialRequest {
                        Toggle("Extra frosting", isOn: $order.extraFrosting)
                        Toggle("Extra sprinkles", isOn: $order.sprinkles)
   
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
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
