//
//  ViewController.swift
//  TableDisplay
//
//  Created by Sanchay jain on 14/10/21.
//

import UIKit

class DeskDetailTableViewController: UITableViewController {

    private enum DummyData {
        static let deskDetailCellIdentifier = "deskDetailTableViewCell"
        static let deskImageNameArray = ["Desk1", "Desk2", "Desk3", "Desk4"]
        static let deskNumberArray = ["Lvl 3A 25", "Lvl 3A 35", "Lvl 3A 45", "Lvl 3A 65"]
        static let guidanceText = " Please select a desk from the displayed list"
    }
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        title = "Desk details"
        tableView.estimatedRowHeight = 150
        tableView.tableFooterView = UIView()
    }
    
    
    //MARK:- UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = DummyData.guidanceText
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.minimumScaleFactor = 0.5
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DummyData.deskImageNameArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DummyData.deskDetailCellIdentifier, for: indexPath)
        if let cell = cell as? DeskDetailTableViewCell {
            cell.deskImageView.layer.cornerRadius = 5.0
            cell.deskImageView.layer.borderWidth = 5.0
            cell.deskImageView.layer.borderColor = UIColor.black.cgColor
            cell.deskImageView.image = UIImage(imageLiteralResourceName: DummyData.deskImageNameArray[indexPath.row])
            cell.deskNumber.text = DummyData.deskNumberArray[indexPath.row]
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
        cell?.setSelected(true, animated: true)
        self.performSegue(withIdentifier: "showMapView", sender: self)
    }
}

