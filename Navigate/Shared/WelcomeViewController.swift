//
//  WelcomeViewControllerr.swift
//  Navigate (iOS)
//
//  Created by Fung, Jessey on 14/10/21.
//

import UIKit

public class WelcomeViewController: UIViewController {
    
    let levels = ["Any"] + Level.allCases.map { $0.rawValue }
    let areas = ["Any"] + Area.allCases.map { $0.rawValue }
    let features = ["Any"] + Feature.allCases.map { $0.rawValue }

    let config = WelcomeConfig()
    var levelSpecified = false
    var areaSpecified = false
    var featureSpecified = false
    var tableData: [WelcomeConfig.Row] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "\(config.welcomeTitle)\n\(config.name)"
        welcomeSubtextLabel.text = config.welcomeSubheading
        setupPickers()
        view.addSubview(welcomeLabel)
        view.addSubview(welcomeSubtextLabel)
        view.addSubview(levelTextField)
        view.addSubview(areaTextField)
        view.addSubview(featuresTextField)
        view.addSubview(tableView)
        tableData = config.tableViewRows
        tableView.delegate = self
        tableView.dataSource = self
        setupLayoutConstraints()
    }
    
    private func setupPickers() {
        levelTextField.inputView = levelPickerView
        areaTextField.inputView = areaPickerView
        featuresTextField.inputView = featurePickerView
        levelTextField.placeholder = "Select level"
        areaTextField.placeholder = "Select area"
        featuresTextField.placeholder = "Select feature"
        levelTextField.textAlignment = .center
        areaTextField.textAlignment = .center
        featuresTextField.textAlignment = .center
        levelPickerView.delegate = self
        levelPickerView.dataSource = self
        areaPickerView.delegate = self
        areaPickerView.dataSource = self
        featurePickerView.delegate = self
        featurePickerView.dataSource = self
        levelPickerView.tag = 1
        areaPickerView.tag = 2
        featurePickerView.tag = 3
    }
    
    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            welcomeLabel.bottomAnchor.constraint(equalTo: welcomeSubtextLabel.topAnchor, constant: -25),
            welcomeSubtextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            welcomeSubtextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            levelTextField.topAnchor.constraint(equalTo: welcomeSubtextLabel.bottomAnchor, constant: 20),
            levelTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            levelTextField.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -5),
            areaTextField.topAnchor.constraint(equalTo: welcomeSubtextLabel.bottomAnchor, constant: 20),
            areaTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
            areaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            featuresTextField.topAnchor.constraint(equalTo: levelTextField.bottomAnchor, constant: 8),
            featuresTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            featuresTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: featuresTextField.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
    
    // MARK: Text views
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.register(FilterTableCell.self, forCellReuseIdentifier: "cellId")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorInset = .init(top: .zero, left: 20, bottom: .zero, right: 20)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(for: .largeTitle, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var welcomeSubtextLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(for: .title3, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var levelTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var areaTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var featuresTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var levelPickerView = UIPickerView()
    var areaPickerView = UIPickerView()
    var featurePickerView = UIPickerView()
}

extension WelcomeViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! FilterTableCell
        cell.configure(row: tableData[indexPath.row])
        return cell
    }
}

public extension UIFont {
    static func preferredFont(for style: TextStyle, weight: Weight) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: style)
        let desc = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
        let font = UIFont.systemFont(ofSize: desc.pointSize, weight: weight)
        return metrics.scaledFont(for: font)
    }
}
