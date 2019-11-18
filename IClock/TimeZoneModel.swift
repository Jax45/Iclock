//
//  TimeZoneModel.swift
//  IClock
//
//  Created by user159466 on 11/18/19.
//  Copyright © 2019 umsl. All rights reserved.
//

import Foundation

class TimeZoneModel {
    
    private let timeZones = TimeZone.knownTimeZoneIdentifiers
    
    func getCount() -> Int{
        return timeZones.count
    }
    func getTimeZone(at: Int) -> String{
        return timeZones[at]
    }
    func contains(text: String) -> Bool{
        return timeZones.contains(text)
    }
}
