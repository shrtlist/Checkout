//
//  CheckoutView.swift
//  CheckoutInterview
//

import SwiftUI

struct CheckoutView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var buttonText = "Submit"

    var body: some View {
        NavigationStack {
            List(viewModel.orderResponse?.items ?? [], id: \.name) { item in
                VStack(alignment: .leading) {
                    Text(item.name)
                    Text(item.displayPrice ?? "Free")
                }
            }
            .listStyle(.plain)
            .navigationDestination(isPresented: $viewModel.isTaskCompleted) {
                SubmittedView(status: viewModel.submissionResponse?.status ?? .delivery_in_progress)
            }
            Spacer()

            Button(buttonText) {
                // Add action
                Task {
                    guard let orderId = viewModel.orderResponse?.id else {
                        return
                    }
                    buttonText = "Submitting..."
                    await viewModel.submitOrder(orderId: orderId)
                    buttonText = "Submit"
                }
            }
            .buttonStyle(.bordered)
            .foregroundColor(.black)
        }
        .padding(.bottom)
        .task {
            await viewModel.fetchOrder()
        }
    }
}
