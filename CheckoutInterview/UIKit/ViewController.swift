//
//  ViewController.swift
//  CheckoutInterview
//

import UIKit

class ViewController: UIViewController {
    private let service = CheckoutService()
    private let asyncService = CheckoutServiceAsync()
    private let combineService = CheckoutServiceCombine()

    lazy var button = {
        var configuration = UIButton.Configuration.gray()
        configuration.cornerStyle = .fixed
        configuration.background.cornerRadius = 8
        configuration.baseForegroundColor = UIColor.black
        configuration.title = "Submit"

        let button = UIButton(
            configuration: configuration,
            primaryAction: UIAction { _ in
                // add your button action
            }
        )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addButton()
        
        // uncomment the version of the service you prefer to use
//        service.fetchOrder()
//        Task { await asyncService.fetchOrder() }
//        combineService.fetchOrder()
    }

    private func addButton() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            button.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor)
        ])
    }
}
