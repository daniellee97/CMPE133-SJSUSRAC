//
//  Rack.swift
//  SJSUSRAC
//
//  Created by student on 11/1/19.
//  Copyright © 2019 Daniel Lee. All rights reserved.
//

import Foundation

class Rack {
   // let UIImage =
    var availableTimes = [Bool]()
    
    func reserveTimeSlot(timeSlot: Int) -> Bool {
        if(availableTimes[timeSlot] == true) {
            //make the available time unavailable to others in database
            //add the slot to the user's profile
            return true
        } else {
            //throw an exception
        return false
        }
    }
    
    func createTimeSlots(date: Date) -> Bool {
        //go into database and make the slots for the day
        return false;
    }
    
}
    
    enum SRACHours: Int {
        case WEEKDAY = 18
        case WEEKEND = 15
        case TIMEBLOCK = 3
    }
    

