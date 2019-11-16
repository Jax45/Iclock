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
    @IBOutlet weak var hourTen: UILabel!
    
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
        let hour = Calendar.current.component(.hour, from:date)
        let min = Calendar.current.component(.minute, from:date)
        let sec = Calendar.current.component(.second, from:date)

        clock?.timePassed(hour: hour, minute: min, second: sec)
    }
    


}

