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
    private var delegate: MainViewControllerDelegate?
    private var model: TimeZoneModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = TimeZoneModel()
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        

    }
    func setup(delegate: MainViewControllerDelegate){
        self.delegate = delegate
    }
    //number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.getCount()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return model.getTimeZone(at: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = model.getTimeZone(at: row)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        guard let text = textField.text, model.contains(text: text) else{return}
        delegate?.save(timeZone: text)
        navigationController?.popViewController(animated: true)
    }
    
}
