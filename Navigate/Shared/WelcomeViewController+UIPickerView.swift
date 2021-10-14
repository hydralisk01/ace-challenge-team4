//
//  WelcomeViewController+UIPickerView.swift
//  Navigate (iOS)
//
//  Created by Fung, Jessey on 14/10/21.
//

import Foundation
import UIKit

extension WelcomeViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return levels.count
        case 2:
            return areas.count
        case 3:
            return features.count
        default:
            return 1
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return levels[row]
        case 2:
            return areas[row]
        case 3:
            return features[row]
        default:
            return nil
        }
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            levelTextField.text = levels[row]
            levelTextField.resignFirstResponder()
            levelSpecified = levels[row] == "Any" ? false : true
            update()
        case 2:
            areaTextField.text = areas[row]
            areaTextField.resignFirstResponder()
            areaSpecified = areas[row] == "Any" ? false : true
            update()
        case 3:
            featuresTextField.text = features[row]
            featuresTextField.resignFirstResponder()
            featureSpecified = features[row] == "Any" ? false : true
            update()
        default:
            return
        }
    }
    
    func update() {
        tableData = config.tableViewRows
        if levelSpecified, let levelFilter = levelTextField.text {
            tableData = tableData.filter { $0.level == levelFilter }
        }
        
        if areaSpecified, let areaFilter = areaTextField.text {
            tableData = tableData.filter { $0.area == areaFilter }
        }
        if featureSpecified, let featureFilter = featuresTextField.text {
            tableData = tableData.filter { $0.features.contains(featureFilter) }
        }
        tableView.reloadData()
    }
}
