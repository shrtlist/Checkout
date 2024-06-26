//
//  OrderView.swift
//  CheckoutInterview
//

import SwiftUI

struct CheckoutView: View {
    var body: some View {
        VStack {
            Spacer()
            Button("Submit") {
                // Add action
            }
            .buttonStyle(.bordered)
            .foregroundColor(.black)
        }
        .onAppear {
            // uncomment the version of the service you prefer to use
//            CheckoutService().fetchOrder()
//            Task { await CheckoutServiceAsync().fetchOrder() }
//            CheckoutServiceCombine().fetchOrder()
        }
    }
}
