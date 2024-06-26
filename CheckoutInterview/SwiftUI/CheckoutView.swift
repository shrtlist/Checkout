//
//  OrderView.swift
//  CheckoutInterview
//

import SwiftUI

struct CheckoutView: View {
    @State var orderResponse: OrderResponse?
    @State var submissionResponse: SubmissionResponse?
    @State var isTaskCompleted: Bool = false
    @State var buttonText = "Submit"

    var body: some View {
        NavigationStack {
            List(orderResponse?.items ?? [], id: \.name) { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                    Text(item.displayPrice ?? "Free")
                }
            }
            .listStyle(.plain)
            .navigationDestination(isPresented: $isTaskCompleted) {
                SubmittedView(status: submissionResponse?.status ?? .delivery_in_progress)
            }
            Spacer()

            Button(buttonText) {
                // Add action
                Task {
                    guard let orderId = orderResponse?.id else {
                        return
                    }
                    buttonText = "Submitting..."
                    submissionResponse = await CheckoutServiceAsync().submitOrder(orderId: orderId)
                    isTaskCompleted = true
                    buttonText = "Submit"
                }
            }
            .buttonStyle(.bordered)
            .foregroundColor(.black)
        }
        .onAppear {
            Task {
                orderResponse = await CheckoutServiceAsync().fetchOrder()
            }
        }
    }
}
