//
//  CheckoutServiceAsync.swift
//  CheckoutInterview
//

import Foundation

class CheckoutServiceAsync {
    private let session = FakeNetworkSession()

    func fetchOrder() async -> OrderResponse {
        let data = await session.getOrder()
        print(String(data: data, encoding: .utf8)!)

        var response: OrderResponse
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            response = try decoder.decode(OrderResponse.self, from: data)
        } catch {
            fatalError()
        }
        return response
    }

    func submitOrder(orderId: String) async -> SubmissionResponse {
        let data = await session.submitOrder(orderId: orderId)
        print(String(data: data, encoding: .utf8)!)

        var response: SubmissionResponse
        do {
            let decoder = JSONDecoder()
            response = try decoder.decode(SubmissionResponse.self, from: data)
        } catch {
            fatalError()
        }
        return response
    }
}
