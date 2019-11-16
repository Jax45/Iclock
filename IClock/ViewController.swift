//
//  ViewController.swift
//  IClock
//
//  Created by user159466 on 11/15/19.
//  Copyright © 2019 umsl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: MainView!
    @IBOutlet weak var HourLabel: UILabel!
    @IBOutlet weak var MinuteLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    @IBOutlet weak var MilliLabel: UILabel!
    @IBOutlet weak var ampmLabel: UILabel!
    
    
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
        var hour = Calendar.current.component(.hour, from:date)
        let min = Calendar.current.component(.minute, from:date)
        let sec = Calendar.current.component(.second, from:date)
        let ns = Calendar.current.component(.nanosecond, from: date)
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
        clock?.timePassed(hour: hour, minute: min, second: sec)
    }
    

    
    
}

