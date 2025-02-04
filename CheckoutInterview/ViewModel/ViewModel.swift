//
//  ViewModel.swift
//  CheckoutInterview
//
//  Created by Marco Abundo on 6/27/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var orderResponse: OrderResponse?
    @Published var status: Status?
    @Published var isTaskCompleted = false

    private let checkoutService = CheckoutServiceAsync()

    func fetchOrder() async {
        orderResponse = await checkoutService.fetchOrder()
    }

    func submitOrder(orderId: String) async {
        isTaskCompleted = false
        status = await checkoutService.submitOrder(orderId: orderId).status
        isTaskCompleted = true
    }
}
