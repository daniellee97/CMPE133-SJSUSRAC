//
//  MacawChartView.swift
//  SJSUSRAC
//
//  Created by Daniel Lee on 10/28/19.
//  Copyright © 2019 Daniel Lee. All rights reserved.
//

import Foundation
import Macaw

class MacawChartView: MacawView {
    
    static let lastFiveHours = createDummydata()
    static let maxValue = 500
    static let maxValueLineHeight = 180
    static let lineWidth: Double = 275
    
    static let dataDivisor = Double(maxValue/maxValueLineHeight)
    static let adjustedData: [Double] = lastFiveHours.map({ $0.numberOfVisitors/dataDivisor})
    static var animations: [Animation] = []
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(node: MacawChartView.createChart(), coder: aDecoder)
        backgroundColor = .clear
    }
    
    private static func createChart() -> Group {
        return Group()
    }
    
    private static func addYAxisItems() -> [Node] {
        return []
    }
    
    private static func addXAxisItems() -> [Node] {
        return []
    }
    
    private static func createBars() -> Group {
        return Group()
    }
    
    
    private static func createDummydata() -> [BusyHours] {
        let one = BusyHours(hours: 10, numberOfVisitors: 100)
        let two = BusyHours(hours: 11, numberOfVisitors: 250)
        let three = BusyHours(hours: 12, numberOfVisitors: 400)
        let four = BusyHours(hours: 13, numberOfVisitors: 459)
        let five = BusyHours(hours: 14, numberOfVisitors: 300)
        
        return [one, two, three, four, five]
    }
}
