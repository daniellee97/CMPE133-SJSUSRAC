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
    static let lineWidth: Double = 495
    
    static let dataDivisor = Double(maxValue/maxValueLineHeight)
    static let adjustedData: [Double] = lastFiveHours.map({ $0.numberOfVisitors/dataDivisor})
    static var animations: [Animation] = []
    
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(node: MacawChartView.createChart(), coder: aDecoder)
        backgroundColor = .clear
    }
    
    private static func createChart() -> Group {
        var items: [Node] = addYAxisItems() + addXAxisItems()
        items.append(createBars())
        return Group(contents: items, place: .identity)
    }
    
    private static func addYAxisItems() -> [Node] {
        let maxLines = 6
        let lineInterval = Int(maxValue/maxLines)
        let yAxisHeight: Double = 200
        let lineSpacing: Double = 30
        
        var newNodes: [Node] = []
        for i in 1...maxLines {
            let y = yAxisHeight - (Double(i) * lineSpacing)
            let valueLine = Line(x1: -5, y1: y, x2: lineWidth, y2: y).stroke(fill: Color.black.with(a: 0.10))
            let valueText = Text(text: "\(i * lineInterval)", align: .max, baseline: .mid, place: .move(dx: -10,dy: y))
            valueText.fill = Color.black
            
            //newNodes.append(valueLine)
            //newNodes.append(valueText)
        }
        let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).stroke(fill: Color.black.with(a: 0.25))
        //newNodes.append(yAxis)
        return newNodes
    }
    
    private static func addXAxisItems() -> [Node] {
        let chartBaseY: Double = 200
        var newNodes: [Node] = []
        
        for i in 1...adjustedData.count {
            let x = (Double(i) * 50)
            let valueText = Text(text: lastFiveHours[i-1].hours, align: .max, baseline: .mid, place: .move(dx: x, dy: chartBaseY+15))
            valueText.fill = Color.black
            newNodes.append(valueText)
            
        }
        let xAxis = Line(x1: 0, y1: chartBaseY, x2: lineWidth, y2: chartBaseY).stroke(fill: Color.black.with(a: 0.25))
        newNodes.append(xAxis)
        return newNodes
    }
    
    private static func createBars() -> Group {
        let fill = LinearGradient(degree: 90, from: Color(val: 0xff4704), to: Color(val: 0xff4704).with(a: 0.33))
        let items = adjustedData.map {_ in Group()}

        animations = items.enumerated().map { (i: Int, item: Group) in
            item.contentsVar.animation(delay: Double(i) * 0.1) { t in
                let height = adjustedData[i] * t
                let rect = Rect(x: Double(i) * 50 + 25, y: 200 - height, w: 30, h: height)
                return [rect.fill(with: fill)]
            }
        }
        
        
        return items.group()
    }
    
    static func playAnimation() {
        animations.combine().play()
    }
    
    
    private static func createDummydata() -> [BusyHours] {
        let one = BusyHours(hours: "10", numberOfVisitors: 100)
        let two = BusyHours(hours: "11", numberOfVisitors: 250)
        let three = BusyHours(hours: "12", numberOfVisitors: 400)
        let four = BusyHours(hours: "13", numberOfVisitors: 459)
        let five = BusyHours(hours: "14", numberOfVisitors: 300)
        let six = BusyHours(hours: "15", numberOfVisitors: 700)
        let seven = BusyHours(hours: "16", numberOfVisitors: 50)
             let eight = BusyHours(hours: "10", numberOfVisitors: 100)
           let nine = BusyHours(hours: "11", numberOfVisitors: 250)
           
        return [one, two, three, four, five, six, seven, eight, nine]
    }
}
