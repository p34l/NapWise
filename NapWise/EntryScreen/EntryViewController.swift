//
//  EntryViewController.swift
//  NapWise
//
//  Created by Misha Kandaurov on 01.06.2025.
//

import UIKit

class EntryViewController: UIViewController {
    private let viewModel: EntryViewModel

    init(viewModel: EntryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var greetingModified: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .label
        label.font = .systemFont(ofSize: 24, weight: .bold)

        return label
    }()

    private lazy var appName: UILabel = {
        let label = UILabel()
        label.text = "NapWise"
        label.textColor = .label
        label.font = .systemFont(ofSize: 36, weight: .medium)

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        viewModel.onGreetingUpdated = { [weak self] greeting in
            self?.greetingModified.text = greeting
        }
        viewModel.loadGreeting()

        setupConstraints()
    }

    private func setupConstraints() {
        [greetingModified, appName].forEach {
            view.addSubview($0)
        }

        [greetingModified, appName]
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            greetingModified.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            greetingModified.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            appName.topAnchor.constraint(equalTo: greetingModified.bottomAnchor, constant: 20),
            appName.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }
}
