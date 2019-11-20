//
//  ClockModel.swift
//  IClock
//
//  Created by user159466 on 11/18/19.
//  Copyright © 2019 umsl. All rights reserved.
//

import Foundation

class ClockModel {
    private var calendar = Calendar.current
    private let defaults = UserDefaults.standard

    init() {
        if let identifier = defaults.value(forKey: "timeZone"){
            calendar.timeZone = TimeZone(identifier: identifier as! String)!
        }
    }
    
    func saveTimeZone(timeZoneName: String){
        defaults.set(timeZoneName, forKey: "timeZone")
    }
    
    func getCalendar() -> Calendar{
        return calendar
    }
    func setCalendarTimeZone(timeZone: TimeZone){
        calendar.timeZone = timeZone
    }
    func updateClock() -> (Int,Int,Int,Int,String,String){
        
        let date = Date()
        
        var hour = calendar.component(.hour, from:date)
        let min = calendar.component(.minute, from:date)
        let sec = calendar.component(.second, from:date)
        let ns = calendar.component(.nanosecond, from: date)
        let ms = ns / 1000000
        let ampm: String
        
        
        if hour - 12 >= 0{
            hour -= 12
            if hour == 0{
                hour = 12
            }
            ampm = "PM"
        }
        else{
            if hour == 0{
                hour = 12
            }
            ampm = "AM"
        }
        let ahead = String((calendar.timeZone.secondsFromGMT() - Calendar.current.timeZone.secondsFromGMT()) / 3600)
        return (hour,min,sec,ms,ampm,ahead)
    }
}
