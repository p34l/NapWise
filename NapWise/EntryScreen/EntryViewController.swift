//
//  EntryViewController.swift
//  NapWise
//
//  Created by Misha Kandaurov on 01.06.2025.
//

import SnapKit
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

    private let topContainer = UIImageView()
    private let midContainer = UIView()

    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2

        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 0.35
        label.layer.shadowOffset = CGSize(width: 0, height: 2)
        label.layer.shadowRadius = 4
        label.layer.masksToBounds = false

        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blur.alpha = 0.2
        blur.layer.cornerRadius = 8
        blur.layer.masksToBounds = true
        blur.translatesAutoresizingMaskIntoConstraints = false
        label.insertSubview(blur, at: 0)

        NSLayoutConstraint.activate([
            blur.topAnchor.constraint(equalTo: label.topAnchor, constant: -4),
            blur.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 4),
            blur.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: -8),
            blur.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
        ])

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let greetingInfo = viewModel.getGreetingInfo()
        greetingLabel.text = greetingInfo.greeting
        topContainer.image = UIImage(named: greetingInfo.imageName)

        setupUI()
        setupConstraints()
    }

    private func setupUI() {
        topContainer.contentMode = .scaleAspectFill
        topContainer.clipsToBounds = true

        midContainer.backgroundColor = UIColor(named: "EntryMidViewColor")
        midContainer.layer.cornerRadius = 32
        midContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        midContainer.clipsToBounds = true

        view.addSubview(topContainer)
        topContainer.addSubview(greetingLabel)

        view.addSubview(midContainer)
    }

    private func setupConstraints() {
        topContainer.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.33)
        }

        greetingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview().offset(20)
        }

        midContainer.snp.makeConstraints { make in
            make.top.equalTo(topContainer.snp.bottom).offset(-40)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
