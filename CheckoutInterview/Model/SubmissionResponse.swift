//
//  SubmissionResponse.swift
//  CheckoutInterview
//
//  Created by Marco Abundo on 6/25/24.
//

import Foundation

struct SubmissionResponse: Decodable {
    let status: Status
}

enum Status: String, Decodable {
    case preparingOrder = "preparing_order"
    case deliveryInProgress = "delivery_in_progress"
    case delivered

    var localizedString: String {
        switch self {
        case .preparingOrder:
            return NSLocalizedString("Preparing Order", comment: "Some comment")
        case .deliveryInProgress:
            return NSLocalizedString("Delivery In Progress", comment: "Some comment")
        case .delivered:
            return NSLocalizedString("Delivered", comment: "Some comment")
        }
    }
}
