//
//  StopwatchModel.swift
//  IClock
//
//  Created by user159466 on 11/18/19.
//  Copyright © 2019 umsl. All rights reserved.
//

import Foundation
class StopwatchModel{
    
    private let calendar: Calendar = Calendar.current
    private let defaults = UserDefaults.standard
    private var isRunning: Bool = false
    private var startTime: Date = Date();
    private var runningTime: (h:Int,m:Int,s:Int,ms:Int) = (0,0,0,0)
    private var storedTime: (h:Int,m:Int,s:Int,ms:Int) = (0,0,0,0)
    
    init(){
        isRunning = defaults.bool(forKey: "isRunning")
        startTime = defaults.object(forKey: "startTime") as? Date ?? Date()
        runningTime = getDefaults(key: "runningTime")
        storedTime = getDefaults(key: "storedTime")
    }
    func startStopPressed() -> Bool{
        isRunning = !isRunning
        defaults.set(isRunning, forKey: "isRunning")
        if(isRunning){
            //started again new start time
            startTime = Date();
            defaults.set(startTime, forKey: "startTime")
            return false
            
        }
        else{
            //store the current time
            storedTime = runningTime
            runningTime = (0,0,0,0)
            setDefaults(value: storedTime, key: "storedTime")
            setDefaults(value: runningTime, key: "runningTime")
            return true
            
        }
    }
    func reset() {
        storedTime = (0,0,0,0)
        runningTime = (0,0,0,0)
        setDefaults(value: storedTime, key: "storedTime")
        setDefaults(value: runningTime, key: "runningTime")
    }
    func updateWatch() ->(Int,Int,Int,Int){
        let date = calendar.dateComponents([.hour, .minute, .second, .nanosecond], from: startTime, to: Date())
        let hour = date.hour!
        let min = date.minute!
        let sec = date.second!
        let ns = date.nanosecond!
        let ms = ns / 1000000
        
        runningTime = (
            hour + storedTime.h,
            min + storedTime.m,
            sec + storedTime.s,
            ms + storedTime.ms)
        if(runningTime.m >= 60){
            runningTime.h += runningTime.m / 60
            runningTime.m = runningTime.m % 60
        }
        if(runningTime.s >= 60){
            runningTime.m += runningTime.s / 60
            runningTime.s = runningTime.s % 60
        }
        if(runningTime.ms >= 1000){
            runningTime.s += runningTime.ms / 1000
            runningTime.ms = runningTime.ms % 1000
        }
        
        setDefaults(value: runningTime,key: "runningTime")
        return runningTime
    }
    func Running() -> Bool {
        return self.isRunning
    }
    func getStoredTime() -> (Int,Int,Int,Int){
        return storedTime
    }
    func setDefaults(value: (Int,Int,Int,Int),key: String) {
        let array = [value.0,value.1,value.2,value.3]
        defaults.set(array, forKey: key)
    }
    func getDefaults(key: String) -> (Int,Int,Int,Int){
        if let array = defaults.value(forKey: key) as? [Int]{
            return (array[0],array[1],array[2],array[3])
        }
        return (0,0,0,0)
    }
}
