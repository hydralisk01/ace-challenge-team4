//
//  WelcomeViewControllerr.swift
//  Navigate (iOS)
//
//  Created by Fung, Jessey on 14/10/21.
//

import UIKit

public class WelcomeViewController: UIViewController {
    
    // MARK: Properties
    
    private lazy var scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.showsVerticalScrollIndicator = false
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      scrollView.addSubview(containerView)
      return scrollView
    }()
    
    private let containerView: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    
    let levels = ["Any"] + Level.allCases.map { $0.rawValue }
    let areas = ["Any"] + Area.allCases.map { $0.rawValue }
    let features = ["Any"] + Feature.allCases.map { $0.rawValue }

    let config = WelcomeConfig()
    var levelSpecified = false
    var areaSpecified = false
    var featureSpecified = false
    var tableData: [WelcomeConfig.Row] = []
    var textFields: [UITextField] = []
    
    // MARK: Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupPickers()
        setupTextFields()
        addSubviews()
        welcomeLabel.text = "\(config.welcomeTitle)\n\(config.name)"
        welcomeLabel.textColor = traitCollection.userInterfaceStyle == .dark ? .white : .black
        welcomeSubtextLabel.text = config.welcomeSubheading
        tableData = config.tableViewRows
        tableView.separatorColor = traitCollection.userInterfaceStyle == .dark ? .white : .lightGray
        tableView.delegate = self
        tableView.dataSource = self
        setupLayoutConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)
        containerView.addSubview(welcomeLabel)
        containerView.addSubview(welcomeSubtextLabel)
        textFields.forEach { containerView.addSubview($0) }
        containerView.addSubview(tableView)
    }
    
    private func setupPickers() {
        levelTextField.inputView = levelPickerView
        areaTextField.inputView = areaPickerView
        featuresTextField.inputView = featurePickerView
        setupTextFields()
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

    private func setupTextFields() {
        textFields = [levelTextField, areaTextField, featuresTextField]
        textFields.forEach {
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 4
            $0.layer.borderColor = traitCollection.userInterfaceStyle == .dark ? UIColor.white.cgColor : UIColor.lightGray.cgColor
        }
        if  traitCollection.userInterfaceStyle == .dark {
            levelTextField.attributedPlaceholder = NSAttributedString(string: "Select level", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])
            areaTextField.attributedPlaceholder = NSAttributedString(string: "Select area", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])
            featuresTextField.attributedPlaceholder = NSAttributedString(string: "Select feature", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])
        } else {
            levelTextField.attributedPlaceholder = NSAttributedString(string: "Select level", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            areaTextField.attributedPlaceholder = NSAttributedString(string: "Select area", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            featuresTextField.attributedPlaceholder = NSAttributedString(string: "Select feature", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        }
    }

    private func setupLayoutConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: containerView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            welcomeLabel.bottomAnchor.constraint(equalTo: welcomeSubtextLabel.topAnchor, constant: -25),
            welcomeSubtextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            welcomeSubtextLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            levelTextField.topAnchor.constraint(equalTo: welcomeSubtextLabel.bottomAnchor, constant: 20),
            levelTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            levelTextField.trailingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -5),
            areaTextField.topAnchor.constraint(equalTo: welcomeSubtextLabel.bottomAnchor, constant: 20),
            areaTextField.leadingAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 5),
            areaTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            featuresTextField.topAnchor.constraint(equalTo: levelTextField.bottomAnchor, constant: 8),
            featuresTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            featuresTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: featuresTextField.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 550)
        ])
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        welcomeLabel.textColor = traitCollection.userInterfaceStyle == .dark ? .white : .black
        setupTextFields()
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
        label.numberOfLines = 0
        label.font = .preferredFont(for: .largeTitle, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var welcomeSubtextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .preferredFont(for: .title3, weight: .semibold)
        label.textColor = .gray
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var levelTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.allowsEditingTextAttributes = false
        textField.accessibilityTraits = UIAccessibilityTraits.staticText
        textField.accessibilityLabel = "Level text field"
        return textField
    }()
    
    var areaTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.allowsEditingTextAttributes = false
        textField.accessibilityTraits = UIAccessibilityTraits.staticText
        textField.accessibilityLabel = "Area text field"
        return textField
    }()
    
    var featuresTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.allowsEditingTextAttributes = false
        textField.accessibilityTraits = UIAccessibilityTraits.staticText
        textField.accessibilityLabel = "Feature text field"
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
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let deskDetailsVC = UIStoryboard(name: "TableDetails", bundle: nil).instantiateViewController(withIdentifier: "DeskDetailViewController") as! DeskDetailTableViewController
        self.navigationController?.pushViewController(deskDetailsVC, animated: true)
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
