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

class ViewController: UIViewController, MainViewControllerDelegate{
    
    @IBOutlet weak var mainView: MainView!
    @IBOutlet weak var HourLabel: UILabel!
    @IBOutlet weak var MinuteLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var MilliLabel: UILabel!
    @IBOutlet weak var ampmLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    private var calendar = Calendar.current
    var clockView = ClockView(frame: .zero)
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.addSubview(clockView)
        let displayLink = CADisplayLink(target: self, selector: #selector(updateClock))
        displayLink.add(to: .current, forMode: .common)
        // Do any additional setup after loading the view.
    }
    @objc func updateClock(){
        let clock = mainView.subviews[0] as? ClockView
        let date = Date()
        
        var hour = calendar.component(.hour, from:date)
        let min = calendar.component(.minute, from:date)
        let sec = calendar.component(.second, from:date)
        let ns = calendar.component(.nanosecond, from: date)
        let ms = ns / 1000000
        
        
        MinuteLabel.text = String(min)
        SecondLabel.text = String(sec)
        MilliLabel.text = String(ms)
        if hour - 12 >= 0{
            hour -= 12
            if hour == 0{ hour = 12}

            HourLabel.text = String(hour)
            ampmLabel.text = "PM"
        }
        else{
            if hour == 0{ hour = 12}
            HourLabel.text = String(hour)
            ampmLabel.text = "AM"
        }
        timeZoneLabel.text = String((calendar.timeZone.secondsFromGMT() - Calendar.current.timeZone.secondsFromGMT()) / 3600) + " Hours Ahead Current TimeZone"
        clock?.timePassed(hour: hour, minute: min, second: sec)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TimeZoneViewController{
            vc.setup(delegate: self)
        }
    }
    
    func save(timeZone: String) {
        calendar.timeZone = TimeZone(identifier: timeZone)!
    }
    
    
}

