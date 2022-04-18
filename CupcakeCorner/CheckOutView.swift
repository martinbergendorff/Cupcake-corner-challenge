//
//  CheckOutView.swift
//  CupcakeCorner
//
//  Created by Martin Bergendorff on 2022-04-07.
//

import SwiftUI

struct CheckOutView: View {
    
    @ObservedObject var order : Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var connectionFailed = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                   image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
            }
            
            Text("Total \(order.cost, format: .currency(code: "USD"))")
                .font(.title)
            
            Button("Place order", action: {
                Task {
                    await placeOrder()
                }
               
            })
                .padding()
                .navigationTitle("Checkout view")
                .navigationBarTitleDisplayMode(.inline)
                
                .alert("Thank you!", isPresented: $showingConfirmation) {
                    Button("OK") { }
                } message: {
                    Text(confirmationMessage)
                }
            
                .alert("Connection Failure", isPresented: $connectionFailed) {
                    Button("Dismiss") { }
                } message: {
                    Text("The connection failed for whatever reason...")
                }
        }
    }
    
    func placeOrder() async {
        print("Sending order...")
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode the order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            showingConfirmation = true
        } catch {
            print("Failed to send order.")
            connectionFailed = true
        }
        
        
        
    }
    
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(order: Order())
    }
}
