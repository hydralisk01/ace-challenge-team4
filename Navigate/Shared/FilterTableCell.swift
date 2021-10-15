//
//  FilterTableCell.swift
//  Navigate (iOS)
//
//  Created by Fung, Jessey on 14/10/21.
//

import Foundation
import UIKit

public class FilterTableCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(row: WelcomeConfig.Row) {
        titleLabel.text = "Level \(row.level) - \(row.area)"
        featuresLabel.text = row.features.map { string -> String in
            return "\u{2022} \(string)"
        }.joined(separator: "\n")
        availabilityLabel.text = "\(String(row.availability)) available"
    }
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .preferredFont(for: .body, weight: .medium)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let featureTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .preferredFont(for: .subheadline, weight: .light)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Features:"
        return label
    }()
    
    private let featuresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .preferredFont(for: .subheadline, weight: .light)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let availabilityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .systemGreen
        label.font = .preferredFont(for: .caption1, weight: .light)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private func setup() {
        setupStack()
        addSubview(stack)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(availabilityLabel)
        addSubview(featureTitleLabel)
        addSubview(featuresLabel)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            stack.bottomAnchor.constraint(equalTo: featureTitleLabel.topAnchor, constant: -8),
            
            featureTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            featureTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            featureTitleLabel.bottomAnchor.constraint(equalTo: featuresLabel.topAnchor),
            
            featuresLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            featuresLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            featuresLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    private func setupStack() {
        stack.axis = traitCollection.preferredContentSizeCategory.isAccessibilityCategory ? .vertical : .horizontal
        stack.distribution = traitCollection.preferredContentSizeCategory.isAccessibilityCategory ? .fillProportionally : .fill
        stack.alignment = .fill
        availabilityLabel.textAlignment = traitCollection.preferredContentSizeCategory.isAccessibilityCategory ? .left : .right
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupStack()
    }
    
}
