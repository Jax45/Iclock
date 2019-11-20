//
//  ViewController.swift
//  IClock
//
//  Created by user159466 on 11/15/19.
//  Copyright © 2019 umsl. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate {
    func save(timeZone: String);
}

class ClockViewController: UIViewController, MainViewControllerDelegate{
    
    @IBOutlet weak var mainView: MainView!
    @IBOutlet weak var HourLabel: UILabel!
    @IBOutlet weak var MinuteLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var MilliLabel: UILabel!
    @IBOutlet weak var ampmLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
//    private var calendar = Calendar.current
    private var clockView = ClockView(frame: .zero)
    private var model: ClockModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        model = ClockModel()
        mainView.addSubview(clockView)
        
        let displayLink = CADisplayLink(target: self, selector: #selector(updateClock))
        displayLink.add(to: .current, forMode: .common)
        // Do any additional setup after loading the view.
    }
    @objc func updateClock(){
        let clock = mainView.subviews[0] as? ClockView
        let modelReturnValues: (h: Int,m: Int,s: Int,ms: Int,ampm: String,timeAhead: String) = model.updateClock();
        HourLabel.text = String(modelReturnValues.h)
        MinuteLabel.text = String(modelReturnValues.m)
        SecondLabel.text = String(modelReturnValues.s)
        MilliLabel.text = String(modelReturnValues.ms)
        ampmLabel.text = modelReturnValues.ampm
        timeZoneLabel.text = modelReturnValues.timeAhead + " Hours Ahead Current TimeZone"
        clock?.timePassed(hour: modelReturnValues.h, minute: modelReturnValues.m, second: modelReturnValues.s)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TimeZoneViewController{
            vc.setup(delegate: self)
        }
    }
    
    func save(timeZone: String) {
        model.setCalendarTimeZone(timeZone: TimeZone(identifier: timeZone)!)
        model.saveTimeZone(timeZoneName: timeZone)
        
    }
    
    
}

