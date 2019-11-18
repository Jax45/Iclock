//
//  TimeZoneViewController.swift
//  IClock
//
//  Created by user159466 on 11/16/19.
//  Copyright © 2019 umsl. All rights reserved.
//


import UIKit

class TimeZoneViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    private var timeZones: [String] = []
    private var delegate: MainViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        timeZones = TimeZone.knownTimeZoneIdentifiers

    }
    func setup(delegate: MainViewControllerDelegate){
        self.delegate = delegate
    }
    //number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return timeZones.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return timeZones[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = timeZones[row]
    }
    
    @IBAction func savePressed(_ sender: Any) {
        guard let text = textField.text, timeZones.contains(text) else{return}
        delegate?.save(timeZone: text)
        navigationController?.popViewController(animated: true)
    }
    
}
